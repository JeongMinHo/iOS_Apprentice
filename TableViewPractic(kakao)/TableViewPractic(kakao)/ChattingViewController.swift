//
//  ViewController.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/02.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

//enum SettingRow: CaseIterable {
//
//    case one
//    case two
//
//
//    var settingCell: String {
//        switch self {
//        case .one: return "첫번째"
//        case .two: return "두번째"
//        }
//    }
//}
//
//struct SettingRow {
//
//    var settingCell: Int
//
//}

class ChattingViewController: UIViewController {
    let cellIdentifier: String = "ChattingCell"
    var models: [Chatting] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNavigationController()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Chatting") else {
            return
        }

        do {
            self.models = try jsonDecoder.decode([Chatting].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    
    }

    func setNavigationController() {
           navigationController?.navigationBar.isTranslucent = false
           navigationController?.navigationBar.shadowImage = UIImage()
    }

}


// MARK: - TableView
// MARK: - Data Source

extension ChattingViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath)
        guard let cell = dequeued as? ChattingCell else {
            return dequeued
        }
        
//        cell.chattingImage.layer.cornerRadius = 15x
        
//        cell.getCurrentDateTime()
       
        let friend: Chatting = self.models[indexPath.row]
         
        cell.chattingID.text = friend.profileTitle
        cell.chattingTime.text = "(\(friend.profileDate))"
        cell.chattingField.text = friend.lastConversation
//        cell.chattingImage
        
        
        cell.separatorInset = UIEdgeInsets.zero
        
    
        
        return cell
    }
}

// MARK: - Delegate

extension ChattingViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if models[indexPath.row].settingCell == 1 {
//            let viewController = storyboard.instantiateViewController(identifier: "FirstViewController")
//            navigationController?.pushViewController(viewController, animated: true)
//        } else if models[indexPath.row].settingCell == 2 {
//            let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
//            navigationController?.pushViewController(viewController, animated: true)
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}




