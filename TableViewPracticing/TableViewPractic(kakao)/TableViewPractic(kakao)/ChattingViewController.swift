//
//  ViewController.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/02.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController {

    var models: [Chatting] = []
    
    
//    let roomNo: Int
//    let profileList: String
//    let title: String
//    let lastConv: String
//    let date: String

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setNavigationController()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
    
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "chatting") else {
            return
        }

        do {
            self.models = try jsonDecoder.decode([Chatting].self, from: dataAsset.data)
            print("1.3")
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
        
        cell.chattingImage.layer.cornerRadius = 15
        
        let friend: Chatting = self.models[indexPath.row]

        cell.chattingID.text = friend.title
        
        cell.chattingField.text = friend.lastConv
        let imageURL = URL(string: friend.profileList)!
        
        do {
            let data = try Data(contentsOf: imageURL)
            cell.chattingImage.image = UIImage(data: data)
        } catch {
          print("minho")
        }
        
        let dateformatter: DateFormatter = {
            let formatter: DateFormatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
            
            return formatter
        }()
        
        
        func dateFormatterSetting() {
            let date: Date = dateformatter.date(from: friend.date) ?? Date()
            dateformatter.dateFormat = "hh:mm"
            let dateString: String = dateformatter.string(from: date)
            return cell.chattingTime.text = dateString
        }
        
        dateFormatterSetting()
        
        
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




