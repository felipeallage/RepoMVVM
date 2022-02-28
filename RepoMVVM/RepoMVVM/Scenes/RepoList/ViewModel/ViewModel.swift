//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation



class RepoViewModel {
    
    var repositoryAPI = RepositoryAPI()
    
    func getRepository(repository: @escaping (UserInfoContainer) -> Void) {
        repositoryAPI.getRepository(completition: repository)
    }
    
}
