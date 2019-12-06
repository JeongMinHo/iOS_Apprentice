//
//  APIResponse.swift
//  UITableViewSample
//
//  Created by Minseob Yoon on 05/12/2019.
//  Copyright © 2019 Minseob Yoon. All rights reserved.
//

import Foundation

// Generic : 코드 재사용할때 도움이 된다.
struct APIResponse<T: Codable>: Codable {
    // Codable : 자신을 변환하거나 외부표현(external representation)으로 변환할 수 있는 타입.
    // Codable = Decodable && Encodable : Codable은 Decodable과 Encodable 프로토콜을 준수하는 타입이다.
    let result: T
}

