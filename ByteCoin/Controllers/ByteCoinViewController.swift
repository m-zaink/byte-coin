//
//  ViewController.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {
    @IBOutlet weak var byteCoinPriceStack: UIStackView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var byteCoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    let byteCoinBrain: ByteCoinBrain = ByteCoinBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        byteCoinBrain.delegate = self
        
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
        
        hideErrorLabel()
        
        if let currency = CurrencyModel(rawValue: currencyPickerView.selectedRow(inComponent: 0))?.code {
            self.fetchConversionPrice(for: currency)
        }
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        if let currency = CurrencyModel(rawValue: currencyPickerView.selectedRow(inComponent: 0))?.code {
            self.fetchConversionPrice(for: currency)
        }
    }
    
    func fetchConversionPrice(for currency: String) {
        byteCoinBrain.fetchConversionPrice(for: currency)
        DispatchQueue.main.async {
            self.hideErrorLabel()
            self.hideByteCoinPriceStack()
            self.showLoadingView()
        }
    }
    
    func showByteCoinPriceStack() {
        byteCoinPriceStack.isHidden = false
    }
    
    func hideByteCoinPriceStack() {
        byteCoinPriceStack.isHidden = true
    }
    
    func showLoadingView() {
        loadingView.startAnimating()
        loadingView.isHidden = false
    }
    
    func hideLoadingView() {
        loadingView.stopAnimating()
        loadingView.isHidden = true
    }
    
    func showErrorLabel() {
        errorLabel.isHidden = false
    }
    
    func hideErrorLabel() {
        errorLabel.isHidden = true
    }
}

extension ByteCoinViewController: ByteCoinBrainDelegate {
    func byteCoinBrain(_ byteCoinBrain: ByteCoinBrain, didFetchConversionPrice price: Double) {
        print("Price: \(price)")
        DispatchQueue.main.async {
            self.byteCoinPriceLabel.text = String(format: "%.2f", price)
            self.hideLoadingView()
            self.showByteCoinPriceStack()
        }
    }
    
    func byteCoinBrain(_ byteCoinBrain: ByteCoinBrain, failedToFetchConversionPrice error: String) {
        print("Error: \(error)")
        DispatchQueue.main.async {
            self.hideByteCoinPriceStack()
            self.hideLoadingView()
            self.showErrorLabel()
        }
    }
}


extension ByteCoinViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrencyModel.count.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let currency: CurrencyModel = CurrencyModel(rawValue: row) {
            return currency.code
        }
        
        return nil
    }
}

extension ByteCoinViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let currency = CurrencyModel(rawValue: row)?.code {
            self.fetchConversionPrice(for: currency)
        }
    }
}
