//
//  AddItemViewController.swift
//  Checklists
//
//  Created by jeongminho on 2019/11/21.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.largeTitleDisplayMode = .never

    }

  //MARK: - Actions
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func done() {
    navigationController?.popViewController(animated: true)
  }
  

}
