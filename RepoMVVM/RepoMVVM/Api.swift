//
//  Api.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

struct RepoAPIContainer {
    
    var nextPage: Bool
    
    var container: UserInfoContainer
    
}

struct RepositoryAPI {
    
    func getRepository(link: String, completition: @escaping (RepoAPIContainer) -> Void) {
        
        guard let url = URL(string: link) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            var nextPageExists = false
            if let data = data, let response = response as? HTTPURLResponse{
                if let nextPage = response.allHeaderFields["Link"] as? String {
                    nextPageExists = nextPage.contains("next")
                }
                let repositoryList = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
                DispatchQueue.main.async {
                    completition(RepoAPIContainer(nextPage: nextPageExists, container: repositoryList))
                }
            }
        }.resume()
    }
    
}
