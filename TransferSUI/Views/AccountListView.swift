//
//  AccountListView.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import SwiftUI

struct AccountListView: View {
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.accountId ){ account in
            AccountCell(account: account)
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        let account = Account(id: UUID(), name: "Ciok Jorge", accountType: .checking, balance: 200.90)
        let accountVM = AccountViewModel(account: account)
        return AccountListView(accounts: [accountVM])
    }
}

struct AccountCell: View {
    var account: AccountViewModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(account.name)
                    .font(.headline)
                Text(account.accountType)
                    .opacity(0.5)
            }
            Spacer()
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(.green)
        }
    }
}
