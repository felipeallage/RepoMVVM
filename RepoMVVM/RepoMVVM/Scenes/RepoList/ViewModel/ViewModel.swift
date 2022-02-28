//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

protocol RepoViewModelDelegate {
    
    func didGetRepo(repo: UserInfoContainer)
    
}

class RepoViewModel {
    
//    var repositoryApi = RepositoryApi()
    
    var repositoryAPIClosure = RepositoryAPIClosure()
    
    var repositoryResults: UserInfoContainer?
    
    var delegate: RepoViewModelDelegate?
    
    
    func getRepoWithClosure() {
        repositoryAPIClosure.getRepository { completition in
            self.delegate?.didGetRepo(repo: completition)
        }
    }
    
    func getRepos(baba: @escaping (UserInfoContainer) -> Void) {
        repositoryAPIClosure.getRepository(completition: baba)
    }
    
    
//    func repoBinding() {
//
//        repositoryApi.delegate = self
//        repositoryApi.getRepository(link: Constants.baseLink)
//
//    }
//
//}

//extension RepoViewModel: RepositoryApiDelegate {
//
//    func didGetRepository(repository: UserInfoContainer) {
//
//        if let items = repository.items {
//            delegate?.didGetRepo(repo: items)
//        }
//
//
//    }
//
//}
}
