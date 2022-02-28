//
//  Api.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

//protocol RepositoryApiDelegate {
//
//    func didGetRepository(repository: UserInfoContainer)
//
//}

//struct RepositoryApi {
//
//    //    var delegate: RepositoryApiDelegate?
//
//    func getRepository(link: String) {
//
//        guard let url = URL(string: link) else {
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) {data, response, error in
//            if let data = data {
//                let repositoryList = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
//                DispatchQueue.main.async {
//                    delegate?.didGetRepository(repository: repositoryList)
//                }
//            }
//        }.resume()
//    }
//}


struct RepositoryAPIClosure {
    
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
