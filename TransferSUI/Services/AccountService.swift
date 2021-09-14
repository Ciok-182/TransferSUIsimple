//
//  AccountService.swift
//  TransferSUI
//
//  Created by Jorge Encinas on 14/09/21.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class AccountService{
    
    private init(){}
    
    static let shared = AccountService()
    
    func getAllAccounts(completion: @escaping(Result<[Account]?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let accounts = try? JSONDecoder().decode([Account].self, from: data)
            if accounts == nil {
                completion(.failure(.decodingError))
                
            } else {
                completion(.success(accounts))
            }
            
        }.resume()
        
    }
    
}
