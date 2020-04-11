//
//  Currency.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import Foundation

enum CurrencyModel: Int {
    case inr = 0
    case usd
    case aud
    case brl
    case cad
    case chf
    case clp
    case cny
    case dkk
    case eur
    case gbp
    case hkd
    case isk
    case jpy
    case krw
    case nzd
    case pln
    case rub
    case sek
    case sgd
    case thb
    case twd
    case count
    
    var code: String {
        switch self {
        case .inr: return "INR"
        case .usd: return "USD"
        case .aud: return "AUD"
        case .brl: return "BRL"
        case .cad: return "CAD"
        case .chf: return "CHF"
        case .cny: return "CNY"
        case .clp: return "CLP"
        case .dkk: return "DKK"
        case .eur: return "EUR"
        case .gbp: return "GBP"
        case .hkd: return "HKD"
        case .isk: return "ISK"
        case .jpy: return "JPY"
        case .krw: return "KRW"
        case .nzd: return "NZD"
        case .pln: return "PLN"
        case .rub: return "RUB"
        case .sek: return "SEK"
        case .sgd: return "SGD"
        case .thb: return "THB"
        case .twd: return "TWD"
        default: return ""
        }
    }
}
