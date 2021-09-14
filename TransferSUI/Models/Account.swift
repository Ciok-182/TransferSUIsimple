//
//  Account.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
// DTO Data transfer Object

import Foundation

enum AccountType: String, Codable, CaseIterable{
    case checking
    case saving
    
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}


struct Account: Codable {
    
    var id: UUID
    var name: String
    var accountType: AccountType
    var balance: Double
    
}
