//
//  ViewController.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/02.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

enum SettingRow: CaseIterable {
    case one
    case two
    case three
    case four
    case five

    var settingCell: String {
        switch self {
        case .one: return "첫번째"
        case .two: return "두번째"
        case .three: return "세번째"
        case .four: return "네번째"
        case .five: return "다섯번째"
        }
    }
}

class ChattingViewController: UIViewController {
    
    var models: [SettingRow] = SettingRow.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNavigationController()
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
        
        return cell
    }
}


