//
//  ViewController.swift
//  StoreSearch
//
//  Created by jeongminho on 2020/03/02.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Variable
    var searchResults = [SearchResult]()
    var hasSearched = false
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView Content inset
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // dismiss KeyBoard
        searchBar.resignFirstResponder()
        

        if searchBar.text != "justin bieber" {
            for i in 0...2 {
                let searchResult = SearchResult()
                searchResult.name = String(format:"Fake Result %d for", i)
                searchResult.artistName = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        hasSearched = true
        tableView.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

// MARK: - UITableView DataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        if searchResults.count == 0 {
            cell.textLabel?.text = "(Nothing found)"
            cell.detailTextLabel?.text = ""
        } else {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel!.text = searchResult.name
            cell.detailTextLabel?.text = searchResult.artistName
            return cell
        }
        return cell
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}
