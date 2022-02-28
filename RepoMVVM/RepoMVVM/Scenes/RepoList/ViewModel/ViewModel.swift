//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation



class RepoViewModel {
    
    var repositoryAPI = RepositoryAPI()
    
    func getRepository(repository: @escaping ([Repository]) -> Void) {
        repositoryAPI.getRepository { completition in
            if let repolist = completition.items {
                repository(repolist)
            }
            
        }
    }
    
}
