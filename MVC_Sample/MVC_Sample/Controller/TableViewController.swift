//
//  TableViewController.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet private weak var searchBar: UISearchBar!
    private var path: String = ""

    private var repositories: [Repository] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "Swift"
        Repository.fetchRepository(q: searchBar.text!) { (results) in
            self.repositories = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(repository: repositories[indexPath.item])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.path = repositories[indexPath.item].path
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(query: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }

    private func search(query: String) {
        Repository.fetchRepository(q: query) { (results) in
            self.repositories = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DetailViewController
            vc.path = self.path
        }
    }

}
