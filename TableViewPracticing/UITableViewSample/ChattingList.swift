//
//  ChattingRoom.swift
//  UITableViewSample
//
//  Created by Minseob Yoon on 05/12/2019.
//  Copyright © 2019 Minseob Yoon. All rights reserved.
//

import Foundation

struct ChattingList: Codable {
    
    var ad: Ad
    var rooms: [Room]
    
    struct Ad: Codable {
        var hasAd: Bool
        var url: String
        var imageURL: String
    }
    
    struct Room: Codable {
        
        let roomNo: Int
        var profileList: [String]
        var title: String
        var lastConversation: String
        var date: String
        
        private enum CodingKeys: String, CodingKey {
            case roomNo
            case profileList
            case title
            case lastConversation = "lastConv"
            case date
        }
    }
}
