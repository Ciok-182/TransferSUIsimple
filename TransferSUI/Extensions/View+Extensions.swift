//
//  View+Extensions.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import Foundation

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
