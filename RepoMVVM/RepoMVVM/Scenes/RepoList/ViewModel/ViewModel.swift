//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

protocol RepoViewModelDelegate {
    
    func didGetRepo(repo: [Repository])
    
}

class RepoViewModel {
    
    var repositoryApi = RepositoryApi()
    
    var repositoryResults: UserInfoContainer?
    
    var delegate: RepoViewModelDelegate?
    
    func repoBinding() {
        
        repositoryApi.delegate = self
        repositoryApi.getRepository(link: Constants.baseLink)
        
    }
    
}

extension RepoViewModel: RepositoryApiDelegate {
    
    func didGetRepository(repository: UserInfoContainer) {
        
        if let items = repository.items {
            delegate?.didGetRepo(repo: items)
        }
        
        
    }
    
}
