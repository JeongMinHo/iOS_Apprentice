//
//  ChattingCell.swift
//  UITableViewSample
//
//  Created by Minseob Yoon on 05/12/2019.
//  Copyright © 2019 Minseob Yoon. All rights reserved.
//

import UIKit

class ChattingCell: UITableViewCell {
    
    @IBOutlet private weak var profileImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var lastConversationLabel: UILabel?
    @IBOutlet private weak var dateLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView?.layer.cornerRadius = 20
        // image 둥그렇게 만들어주는 부분.
        profileImageView?.contentMode = .scaleAspectFill
        // 프로필 이미지 가로,세로 중 더 짧은 것을 화면에 맞추고, 그 비율만큼 긴 쪽을 넓힌다.
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView?.image = nil
        titleLabel?.text = ""
        lastConversationLabel?.text = ""
        dateLabel?.text = ""
    }
    
    
    
    var chattingRoom: ChattingList.Room? {
        didSet {
            // 캐싱 필요
            // 프로필 개수에 따라 조절해줘야함
            if let url = URL(string: chattingRoom?.profileList.first ?? "") {
                if let data = try? Data(contentsOf: url) {
                    profileImageView?.image = UIImage(data: data)
                }
            }
            titleLabel?.text = chattingRoom?.title
            lastConversationLabel?.text = chattingRoom?.lastConversation
            
            let dateFormatter: DateFormatter = {
                let formatter: DateFormatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .medium
                formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
            
                return formatter
            }()
               
            func dateFormatterSetting() {
                let date: Date = dateFormatter.date(from: chattingRoom!.date) ?? Date()
                dateFormatter.dateFormat = "hh:mm"
                let dateString: String = dateFormatter.string(for: date)!
            
                return (dateLabel?.text = dateString)!
            }
    
            dateFormatterSetting()
        }
    }
    
   
    

}
