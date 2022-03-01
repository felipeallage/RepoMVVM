//
//  ViewModel.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

enum SearchState {
    case initial
    case more
}

class RepoViewModel {
    
    private var repositoryAPI = RepositoryAPI()
    
    private var container : RepoAPIContainer?
    
    private var isLoading: Bool = false
    
    private var pageNumber: Int = 1
    
    
    func getRepository(state: SearchState, completion: @escaping (()) -> Void) {
        self.isLoading = true
        repositoryAPI.getRepository(link: getLink(state: state)) { APIContainer in
            if self.container != nil {
                if let itemAppend = APIContainer.container.items {
                    self.container?.container.items?.append(contentsOf: itemAppend)
                }
                self.container?.nextPage = APIContainer.nextPage
                
            } else {
                self.container = APIContainer
            }
            if let nextPage = self.container?.nextPage, nextPage {
                self.pageNumber += 1
            }
            self.isLoading = false
            completion(())
        }
    }
    
    func getItems() -> [Repository] {
        if let items = container?.container.items {
            return items
        }
        return []
    }
    
    func validationMore(index: Int, completion: @escaping (()) -> Void) {
        if let container = container {
            if container.nextPage && index >= self.getItems().count - 10 && !isLoading {
                getRepository(state: .more, completion: completion)
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
    
    
}
