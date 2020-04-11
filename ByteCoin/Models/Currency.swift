//
//  Currency.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import Foundation

enum CurrencyModel: Int {
    case usd = 0
    case inr
    case yen
    case eur
    case count
    
    var code: String {
        switch self {
        case .usd:
            return "USD"
        case .inr:
            return "INR"
        case .yen:
            return "YEN"
        case .eur:
            return "EUR"
        default:
            return ""
        }
    }
}
