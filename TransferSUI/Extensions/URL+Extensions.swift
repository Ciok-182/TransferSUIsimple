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
        //return URL(string: "https://therapeutic-impossible-detective.glitch.me/api/accounts")
        
        //https://therapeutic-impossible-detective.glitch.me
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "https://coral-stealth-anglerfish.glitch.me/api/accounts")
    }
    
    static func urlForTransferFounds() -> URL? {
        return URL(string: "https://coral-stealth-anglerfish.glitch.me/api/transfer")
    }
}
