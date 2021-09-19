//
//  AccountSummaryScreen.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import SwiftUI

enum ActiveSheet{
    case addAccount
    case transferFounds
}

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    var body: some View {
        
        GeometryReader{ g in
            VStack{
                AccountListView(accounts: accountSummaryVM.accounts)
                    .frame(height: g.size.height/2)
                
                Text("\(accountSummaryVM.total.formatAsCurrency())")
                
                Spacer()
                
                Button("Transfer Founds"){
                    self.activeSheet = .transferFounds
                    self.isPresented = true
                }.padding()
            }
        }
        
        .onAppear{
            self.accountSummaryVM.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            self.accountSummaryVM.getAllAccounts()
        }) {
            switch self.activeSheet {
            case .transferFounds:
                TransferFoundsScreen()
            case .addAccount:
                AddAccountScreen()
            }
            
        }
        
        .navigationBarItems(trailing: Button("Add Account"){
            self.activeSheet = .addAccount
            self.isPresented = true
        })
        .navigationTitle("Account Summary")
        .embedInNavigationView()
        
    }
    
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
