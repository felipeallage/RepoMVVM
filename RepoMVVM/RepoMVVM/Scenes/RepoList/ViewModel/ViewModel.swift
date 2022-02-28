//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation



class RepoViewModel {
    
    var repositoryAPIClosure = RepositoryAPIClosure()
    
    func getRepos(baba: @escaping (UserInfoContainer) -> Void) {
        repositoryAPIClosure.getRepository(completition: baba)
        
    }
    
}
