//
//  AccountSummaryViewModel.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import Foundation


class AccountSummaryViewModel: ObservableObject {
    
    private var _accountsModel = [Account]()
    
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var total: Double{
        _accountsModel.map { $0.balance}.reduce(0,+)
    }
    
    func getAllAccounts(){
        
        AccountService.shared.getAllAccounts{ result in
            
            switch result {
            case .success(let accountsResult):
                if let accounts = accountsResult{
                    self._accountsModel = accounts
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                    print("Success \(accounts.count)")
                }
                
            case .failure(let error):
                print("Failure \(error.localizedDescription)")
            }
            
        }
        
    }
    
}


class AccountViewModel {
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String{
        account.name
    }
    
    var accountId: String{
        account.id.uuidString
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double{
        account.balance
    }
    
    
}
