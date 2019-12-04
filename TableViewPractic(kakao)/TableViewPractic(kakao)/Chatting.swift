//
//  Chatting.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/05.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import Foundation

struct Chatting: Codable, CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        <#code#>
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        <#code#>
    }
    
    let roomNumber: Int
    let profileImage: String
    let profileTitle: String
    let lastConversation: String
    let profileDate: Int
}

/*{
  "roomNo": 1,
  "profileList" : ["https://user-images.githubusercontent.com/14807774/70063560-5abd9480-162b-11ea-9d0c-0f7b9c29f3d2.jpeg"],
  "title": "엄마",
  "lastConv": "아들 취업 축하해~",
  "date": "2019-12-02 10:20:10"
} */

