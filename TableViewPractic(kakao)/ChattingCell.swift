//
//  ChattingCell.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/02.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

class ChattingCell: UITableViewCell {

    // MARK: -IBOutlet
//    @IBOutlet var chattingImage: UIImageView!
    @IBOutlet var chattingField: UILabel!
    @IBOutlet var chattingID: UILabel!
    @IBOutlet var chattingTime: UILabel!
    
    func getCurrentDateTime() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "hh:mm"
        let str = formatter.string(from: Date())
        chattingTime.text = "\(str)"
       }
}

