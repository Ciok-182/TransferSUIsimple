//
//  TransferFundRequest.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double
    
}


