//
//  ViewController.swift
//  Real_SettingPractice
//
//  Created by jeongminho on 2019/12/01.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

enum SettingRow {
    case notice
    case ask
    
    var title: String {
        switch self {
        case .notice: return "공지사항"
        case .ask: return "앱문의/건의"
        }
    }
    
    var identifier: String {
        switch self {
        case .notice: return "1"
        case .ask: return "2"
        }
    }
}

class ViewController: UIViewController {
    
    var models: [SettingRow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

    // MARK: - Data Source

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        
        guard let cell = dequeued as? SettingCell else {
            return dequeued
        }
        
        cell.model = models[indexPath.row]
        cell.moveButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.models[indexPath.row].identifier, sender: nil)
        }
        
        return cell
        
    }
}

class SettingCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    var moveButtonTapped: (() -> Void)?
    
    var model: SettingRow? {
        didSet {
            title.text = model?.title
        }
    }
    
    @IBAction func moveButtonTapped(_ sender: UIButton) {
        moveButtonTapped?()
    }
  
}
