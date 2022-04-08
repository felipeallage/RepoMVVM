//
//  OwnerCollectionViewCell.swift
//  RepoMVVM
//
//  Created by Admin on 3/16/22.
//

import UIKit
import Kingfisher

class FollowerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ID"
    
    @IBOutlet weak var followerImageView: UIImageView!
    
    @IBOutlet weak var followerLabel: UILabel!
    
    
    func update(follower: Owner) {
        self.followerLabel.text = "FELIPE"
//        if let link = owner.avatar_url {
//            self.ownerImageView.kf.setImage(with: URL(string: link))
//        }
        
    }
}
