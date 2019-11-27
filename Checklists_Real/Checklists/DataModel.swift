//
//  DataModel.swift
//  Checklists
//
//  Created by jeongminho on 2019/11/28.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation

class DataModel {
  var lists = [Checklist]()
  
  
  // MARK: Data Saving
  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklists.plist")
  }
  
  // this method is now called saveChecklists()
  func saveChecklistItems() {
    let encoder = PropertyListEncoder()
    do {
      let data = try encoder.encode(lists)
      try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
    } catch {
      print("Error encoding item array: \(error.localizedDescription)")
    }
  }
  
  // this methods is now called loadChecklists()
  func loadChecklistItems() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
      let decoder = PropertyListDecoder()
      do {
        lists = try decoder.decode([Checklist].self, from: data)
      } catch {
        print("Error decoding item array: \(error.localizedDescription)")
      }
    }
  }
  
  init() {
    loadChecklistItems()
  }
}
