//
//  ViewController.swift
//  RepoMVVM
//
//  Created by Admin on 2/21/22.
//

import UIKit

class RepoViewController: UIViewController {
    
    
    @IBOutlet weak var repoTableView: UITableView!
    
    var viewModel = RepoViewModel()
    
    var repoList: [Repository] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        repoTableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.identifier)
        repoTableView.dataSource = self
        repoTableView.delegate = self
        viewModel.delegate = self
        viewModel.getRepoWithClosure()
    }


}

extension RepoViewController: RepoViewModelDelegate {
    
    func didGetRepo(repo: UserInfoContainer) {
        self.repoList = repo.items!
        repoTableView.reloadData()
    }
    
}

extension RepoViewController: UITableViewDelegate {
    
    
}

extension RepoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier) as! RepoTableViewCell
        let repository = repoList[indexPath.row]
        cell.update(model: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}
