//
//  CreateAccountRequest.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 17/09/21.
//

import Foundation

struct CreateAccountRequest: Codable {
    let name: String
    let accountType: String
    let balance: Double
}
