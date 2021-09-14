//
//  Double+Extensions.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
    
}
