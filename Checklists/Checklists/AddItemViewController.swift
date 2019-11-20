//
//  AddItemViewController.swift
//  Checklists
//
//  Created by jeongminho on 2019/11/21.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AddItemViewController)
  func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  
  // view가 appear 하면 키보드 자동으로 올라오게 하는 부분
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.largeTitleDisplayMode = .never
    }
  
  // MARK: - Outlets
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: AddItemViewControllerDelegate?

  // MARK: - Actions
  @IBAction func cancel() {
    delegate?.addItemViewControllerDidCancel(self)
  }
  
  @IBAction func done() {
    let item = ChecklistItem()
    item.text = textField.text!
    
    delegate?.addItemViewController(self, didFinishAdding: item)
  }
  
  // MARK: - Table View Delegates
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
  // MARK: - Text Field Delegates
  
  // textfield에 아무것도 입력되지 않았으면 done button 비활성화하는 메소드
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in:oldText)!
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    
//    if newText.isEmpty {
//      doneBarButton.isEnabled = false
//    } else {
//      doneBarButton.isEnabled = true
//    }
    
    // 위를 수정한 코드
    doneBarButton.isEnabled = !newText.isEmpty
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    doneBarButton.isEnabled = false
    return true
  }
  

}
