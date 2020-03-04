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
            static let loadingCell = "LoadingCell"
        }
    }
    
    // MARK: - Variable
    var searchResults = [SearchResult]()
    var hasSearched = false
    var isLoading = false
    
    // MARK: - Helper Methods
    func iTunesURL(searchText: String) -> URL? {
        
        guard let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
//        let urlString = String(format: "https://itunes.apple.com/search?term=\(encodedText)")
        let urlString = String(format: "https://itunes.apple.com/search?term=%@&limit=200",encodedText)
//        let urlString = String(format: "https://NOMOREitunes.apple.com/search?term=%@",encodedText)
        

        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
//    func performStoreRequest(with url: URL) -> Data? {
//        do {
//            return try Data(contentsOf: url)
//        } catch {
//            print("Download Error: \(error.localizedDescription)")
//            showNetworkError()
//            return nil
//        }
//    }
    
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
        
        cellNib = UINib(nibName: TableView.cellIdentifier.loadingCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.cellIdentifier.loadingCell)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return }
        
        if !searchBarText.isEmpty {
            searchBar.resignFirstResponder()
            
            isLoading = true
            tableView.reloadData()
            
            hasSearched = true
            searchResults = []

            guard let searchText = searchBar.text,
                let url = self.iTunesURL(searchText: searchText) else {
                return
            }
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            
                if let error = error {
                    print("Failure! \(error.localizedDescription)")
                } else if let httpResponse = response as? HTTPURLResponse ,
                httpResponse.statusCode == 200 {
                    if let data = data {
                        self.searchResults = self.parse(data: data)
                        self.searchResults.sort { $0 < $1}
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.tableView.reloadData()
                        }
                        return
                    }
                } else {
                    print("Failure! \(response)")
                }
                
                DispatchQueue.main.async {
                    self.hasSearched = false
                    self.isLoading = false
                    self.tableView.reloadData()
                    self.showNetworkError()
                }

            })
            dataTask.resume()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

// MARK: - UITableView DataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if isLoading {
            return 1
        } else if !hasSearched {
            return 0
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isLoading {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier.loadingCell, for: indexPath)
            
            let spinner = cell.viewWithTag(100) as! UIActivityIndicatorView
            spinner.startAnimating()
            return cell
        } else
     
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier.nothingFoundCell, for: indexPath)
            
        } else {
            let dequeued = tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier.searchResultCell, for: indexPath)
            
            guard let cell = dequeued as? SearchResultCell else {
                return dequeued
            }
            
            let searchResult = searchResults[indexPath.row]
            
            if searchResults.isEmpty {
                cell.artistNameLabel.text = "Unknown"
            } else {
                cell.artistNameLabel.text = String(format: "%@ (%@)", searchResult.artist, searchResult.type)
                if let url = URL(string: searchResult.imageSmall), let imageData = try? Data(contentsOf: url) {
                    cell.artworkImageView.image = UIImage(data: imageData)
                }
            }
            
            cell.nameLabel.text = searchResult.name
            
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
        if searchResults.count == 0  || isLoading {
            return nil
        } else {
            return indexPath
        }
    }
}
