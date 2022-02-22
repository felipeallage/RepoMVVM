//
//  Model.swift
//  RepoMVVM
//
//  Created by Admin on 2/22/22.
//

import Foundation

class UserInfoContainer: Codable {
    
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Repository]?
    
}
