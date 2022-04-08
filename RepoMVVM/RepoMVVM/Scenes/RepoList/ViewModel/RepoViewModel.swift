//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation
import CoreMIDI

enum SearchState {
    case initial
    case more
}

protocol RepoViewModelDelegate {
    
    func didSuccess()
    
    func didFailure(error: ErrorApi)
    
}

class RepoViewModel {
    
    private var repositoryAPI = RepositoryAPI()
    
    private var container : RepoAPIContainer?
    
    private var isLoading: Bool = false
    
    private var pageNumber: Int = 1
    
    var delegate : RepoViewModelDelegate?
    
    func getRepository(state: SearchState) {
        self.isLoading = true
        repositoryAPI.getRepository(link: getLink(state: state)) { result in
            switch result {
            case .success(let apiContainer):
                if self.container != nil {
                    if let itemAppend = apiContainer.container.items {
                        self.container?.container.items?.append(contentsOf: itemAppend)
                    }
                    self.container?.nextPage = apiContainer.nextPage
                } else {
                    self.container = apiContainer
                }
                if let nextPage = self.container?.nextPage, nextPage {
                    self.pageNumber += 1
                }
                self.isLoading = false
                self.delegate?.didSuccess()
            case .failure(let error):
                self.delegate?.didFailure(error: error)
            }
        }
    }
    
    func getItems() -> [Repository] {
        if let items = container?.container.items {
            return items
        }
        return []
    }
    
    func validationMore(index: Int) {
        if let container = container {
            if container.nextPage && index >= self.getItems().count - 10 && !isLoading {
                getRepository(state: .more)
                isLoading = true
            }
        }
        
    }
    
    private func getLink(state: SearchState) -> String {
        var apiLink: String = ""
        if state == .initial {
            apiLink = Constants.repoLink
            self.pageNumber = 1
        } else {
            apiLink = Constants.baseLink + "\(pageNumber)"
        }
        return apiLink
    }
    
    func getRepoWithIndex(index: IndexPath) -> Repository? {
        if let container = container, let repoList = container.container.items {
            let repo = repoList[index.row]
            return repo
        }
        return nil
    }
    
    
}
