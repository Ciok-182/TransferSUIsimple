//
//  AccountSummaryScreen.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    var body: some View {
        
        GeometryReader{ g in
            VStack{
                AccountListView(accounts: accountSummaryVM.accounts)
                    .frame(height: g.size.height/2)
                
                Text("\(accountSummaryVM.total.formatAsCurrency())")
                
                Spacer()
            }
        }
        
        .onAppear{
            self.accountSummaryVM.getAllAccounts()
        }
        .navigationTitle("Account Summary")
        .embedInNavigationView()
        
    }
    
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
