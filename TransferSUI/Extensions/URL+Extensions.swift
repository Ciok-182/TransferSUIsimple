//
//  URL+Extensions.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import Foundation

extension URL {
    
    static func urlForAccounts() -> URL? {
         return URL(string: "https://coral-stealth-anglerfish.glitch.me/api/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "https://coral-stealth-anglerfish.glitch.me/api/accounts")
    }
}
