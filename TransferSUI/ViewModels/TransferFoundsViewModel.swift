//
//  TransferFoundsViewModel.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

class TransferFoundsViewModel: ObservableObject {
    
    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?
    
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    
    func populateAccounts() {
        AccountService.shared.getAllAccounts { result in
            
            switch result {
            case .success(let accounts):
                if let accounts = accounts{
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
            
        }
    }
    
}
