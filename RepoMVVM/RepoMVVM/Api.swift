//
//  Api.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

struct RepositoryAPI {
    
    func getRepository(completition: @escaping (UserInfoContainer) -> Void) {
        
        guard let url = URL(string: Constants.baseLink) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                let repositoryList = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
                DispatchQueue.main.async {
                    completition(repositoryList)
                }
            }
        }.resume()
    }
    
    
}
