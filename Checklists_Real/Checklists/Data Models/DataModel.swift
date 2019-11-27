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
  
  var indexOfSelectedChecklist: Int {
    get {
      return UserDefaults.standard.integer(forKey: "ChecklistIndex")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
      UserDefaults.standard.synchronize()
    }
  }
  
  
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
  
  
  func registerDefaults() {
    let dictionary = ["ChecklistIndex": -1, "FirstTime" : true] as [String : Any]
    UserDefaults.standard.register(defaults: dictionary)
  }
  
  func handleFirstTime() {
    let userDefaults = UserDefaults.standard
    let firstTime = userDefaults.bool(forKey: "FirstTime")
    
    if firstTime {
      let checklist = Checklist(name: "List")
      lists.append(checklist)
      
      indexOfSelectedChecklist = 0
      userDefaults.set(false, forKey: "FirstTime")
      userDefaults.synchronize()
    }
  }
  
  init() {
    loadChecklistItems()
    registerDefaults()
    handleFirstTime()
  }
}
