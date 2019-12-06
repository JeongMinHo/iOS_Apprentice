//
//  Chatting.swift
//  TableViewPractic(kakao)
//
//  Created by jeongminho on 2019/12/05.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import Foundation

struct Chatting: Codable {
    
    let roomNo: Int
    let profileList: String
    let title: String
    let lastConv: String
    let date: String?
}

/*{
  "roomNo": 1,
  "profileList" : ["https://user-images.githubusercontent.com/14807774/70063560-5abd9480-162b-11ea-9d0c-0f7b9c29f3d2.jpeg"],
  "title": "민호",
  "lastConv": "배고프다",
  "date": "2019-12-02 10:20:10"
} */

