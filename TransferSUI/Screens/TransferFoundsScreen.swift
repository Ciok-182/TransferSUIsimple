//
//  TransferFoundsScreen.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import SwiftUI

struct TransferFoundsScreen: View {
    
    
    @ObservedObject private var transferFoundsVM = TransferFoundsViewModel()
    
    @State private var showSheet: Bool = false
    @State private var isFromAccount: Bool = false
    
    
    var acctionSheetButtons: [Alert.Button]{
        var actionButtons = transferFoundsVM.filteredAccounts.map{ account in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")){
                
                if isFromAccount {
                    transferFoundsVM.fromAccount = account
                } else {
                    transferFoundsVM.toAccount = account
                }
                
            }
        }
        
        actionButtons.append(.cancel())
        
        return actionButtons
    }
    
    var body: some View {
        VStack {
            AccountListView(accounts: transferFoundsVM.accounts)
                .frame(height: 300)
            
            TransferFoundsAccountSelectionView(transferFoundsVM: transferFoundsVM, showSheet: $showSheet, isFromAccount: $isFromAccount)
            Spacer()
                .onAppear{
                    self.transferFoundsVM.populateAccounts()
                }
                
                .actionSheet(isPresented: $showSheet){
                    ActionSheet(title: Text("Transfer Founds"), message: Text("Choose an account"), buttons: acctionSheetButtons)
                }
            
        }.navigationTitle("Transfer Founds")
        .embedInNavigationView()
    }
}

struct TransferFoundsAccountSelectionView: View {
    
    @ObservedObject var transferFoundsVM: TransferFoundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    
    var body: some View {
        VStack(spacing: 10){
            Button("From \(transferFoundsVM.fromAccountType)"){
                self.showSheet = true
                self.isFromAccount = true
                
                
                
                
            }.padding().frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(Color.white)
            
            Button("To \(transferFoundsVM.toAccountType)"){
                self.showSheet = true
                self.isFromAccount = false
                
                
                
            }.padding().frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(Color.white)
            .opacity(self.transferFoundsVM.fromAccount == nil ? 0.5 : 1)
            .disabled(self.transferFoundsVM.fromAccount == nil ? true : false)
        }.padding()
        
    }
}



struct TransferFoundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFoundsScreen()
    }
}
