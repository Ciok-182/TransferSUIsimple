//
//  AddAccountScreen.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 18/09/21.
//

import SwiftUI

struct AddAccountScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var addAccountVM = AddAccountViewModel()
    
    var body: some View {
        Form{
            TextField("Name", text: self.$addAccountVM.name)
            
            Picker(selection: self.$addAccountVM.accountType, label: EmptyView()) {
                
                ForEach(AccountType.allCases, id: \.self){ accountType in
                    Text(accountType.title).tag(accountType)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("Balance", text: self.$addAccountVM.balance)
            
            HStack {
                Spacer()
                Button("Submit") {
                    self.addAccountVM.createAccount { success in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("Add Account")
        .embedInNavigationView()
    }
}

struct AddAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountScreen()
    }
}
