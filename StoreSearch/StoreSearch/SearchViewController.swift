//
//  ViewController.swift
//  StoreSearch
//
//  Created by jeongminho on 2020/03/02.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // Cell Identifier
    struct TableView {
        struct cellIdentifier {
            static let searchResultCell = "SearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
        }
    }
    
    // MARK: - Variable
    var searchResults = [SearchResult]()
    var hasSearched = false
    
    // MARK: - Helper Methods
    func iTunesURL(searchText: String) -> URL? {
        
        guard let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
//        let urlString = String(format: "https://itunes.apple.com/search?term=\(encodedText)")
        let urlString = String(format: "https://itunes.apple.com/search?term=%@",encodedText)
//        let urlString = String(format: "https://NOMOREitunes.apple.com/search?term=%@",encodedText)
        

        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
    func performStoreRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            showNetworkError()
            return nil
        }
    }
    
    func parse(data: Data) -> [SearchResult] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResultArray.self, from: data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops..", message: "There was an error accessing the iTunes Store." + " Please try again", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        
        // TableView Content inset
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        // NIB
        var cellNib = UINib(nibName: TableView.cellIdentifier.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.cellIdentifier.searchResultCell)
        
        cellNib = UINib(nibName: TableView.cellIdentifier.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.cellIdentifier.nothingFoundCell)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return }
        
        if !searchBarText.isEmpty {
            searchBar.resignFirstResponder()
            
            hasSearched = true
            searchResults = []

            guard let url = iTunesURL(searchText: searchBarText) else { return }
            
            print("URL: \(url)")
            
            if let data = performStoreRequest(with: url) {
                searchResults = parse(data: data)
            }
            tableView.reloadData()
        }
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
     
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier.nothingFoundCell, for: indexPath)
            
        } else {
            let dequeued = tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier.searchResultCell, for: indexPath)
            
            guard let cell = dequeued as? SearchResultCell else {
                return dequeued
            }
            
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
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
