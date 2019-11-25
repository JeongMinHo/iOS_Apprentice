//
//  ChecklistItem.swift
//  Checklists
//
//  Created by jeongminho on 2019/11/21.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
}

