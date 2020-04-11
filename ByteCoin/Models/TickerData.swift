//
//  TickerData.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import Foundation

typealias TickerData = [String: CurrencyData]

struct CurrencyData: Codable {
    let last: Double
}
