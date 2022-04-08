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

    override func viewDidLoad() {
        super.viewDidLoad()
        repoTableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.identifier)
        repoTableView.dataSource = self
        repoTableView.delegate = self
        viewModel.getRepository(state: .initial) { _ in
            self.repoTableView.reloadData()
        }
        
    }
    
}

extension RepoViewController: UITableViewDelegate {
    
}

extension RepoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier) as! RepoTableViewCell
        let repository = viewModel.getItems()[indexPath.row]
        cell.update(model: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.validationMore(index: indexPath.row) { _ in
            self.repoTableView.reloadData()
        }
    }

}
