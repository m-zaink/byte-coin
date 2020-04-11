//
//  ByteCoinBrain.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import Foundation

protocol ByteCoinBrainDelegate {
    func byteCoinBrain(_ byteCoinBrain: ByteCoinBrain, didFetchConversionPrice price: Double)
    func byteCoinBrain(_ byteCoinBrain: ByteCoinBrain, failedToFetchConversionPrice error: String)
}

class ByteCoinBrain {
    var delegate: ByteCoinBrainDelegate?
    let apiEndPoint: String = "https://blockchain.info/ticker"
    
    func fetchConversionPrice(for currency: String) {
        guard let url = URL(string: apiEndPoint) else {
            delegate?.byteCoinBrain(self, failedToFetchConversionPrice: "Invalid URL")
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                self.delegate?.byteCoinBrain(self, failedToFetchConversionPrice: error.localizedDescription)
                return
            }
            
            if let data = data {
                if let tickers = self.parseJSON(data) {
                    if let currencyData = tickers[currency] {
                        self.delegate?.byteCoinBrain(self, didFetchConversionPrice: currencyData.last)
                    } else {
                        self.delegate?.byteCoinBrain(self, failedToFetchConversionPrice: "Missing Currency Type")
                    }
                } else {
                    self.delegate?.byteCoinBrain(self, failedToFetchConversionPrice: "JSON Parsing Error")
                }
            }
        }
        
        task.resume()
    }
    
    
    func parseJSON(_ data: Data) -> TickerData? {
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(TickerData.self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
}
