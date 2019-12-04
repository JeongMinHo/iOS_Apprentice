//
//  ViewController.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/02.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

enum SettingRow: CaseIterable, Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Chatting())
        self.settingCell = try? container.decode(Int.self, forKey: .roomNumber)
        self.settingCell = try? container.decode(String.self, forKey: .profileImage)
        self.settingCell = try? container.decode(String.self, forKey: .profieTitle)
        self.settingCell = try? container.decode(String.self, forKey: .lastConversation)
        self.settingCell = try? container.decode(Int.self, forKey: .profileDate)
        
        
        
    }
    case one
    case two


    var settingCell: String {
        switch self {
        case .one: return "첫번째"
        case .two: return "두번째"
        }
    }
}

class ChattingViewController: UIViewController {
    
    var models: [SettingRow] = SettingRow.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNavigationController()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Chatting") else {
            return
        }
        
        do {
            self.models = try jsonDecoder.decode([SettingRow].self, from: dataAsset.data)
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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath)
        guard let cell = dequeued as? ChattingCell else {
            return dequeued
        }
        
        cell.chattingImage.layer.cornerRadius = 15
        
        cell.getCurrentDateTime()
        
        if models[indexPath.row].settingCell == "첫번째" {
            cell.chattingID.text = "민호"
            cell.chattingField.text = "나 앱 배포 성공했어!!"
        } else if models[indexPath.row].settingCell == "두번째" {
            cell.chattingID.text = "민섭이형"
            cell.chattingField.text = "민호야 제발 도와줘"
            let imageCheck = UIImage(named: "minseob.png")
            cell.chattingImage.image = imageCheck
        }
        
        cell.separatorInset = UIEdgeInsets.zero
        
    
        
        return cell
    }
}

// MARK: - Delegate

extension ChattingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if models[indexPath.row].settingCell == "첫번째" {
            let viewController = storyboard.instantiateViewController(identifier: "FirstViewController")
            navigationController?.pushViewController(viewController, animated: true)
        } else if models[indexPath.row].settingCell == "두번째" {
            let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}




