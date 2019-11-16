//
//  ViewController.swift
//  BullsEye
//
//  Created by jeongminho on 2019/11/15.
//  Copyright © 2019 jeongminho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
  var currentValue: Int = 50
  var targetValue: Int = 0

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  
 

    override func viewDidLoad() {
        super.viewDidLoad()
      self.startNewRound()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
      
        let message = "The value of the silder is \(currentValue)" + "\n The target value is :\(targetValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
      
      startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
      currentValue = lroundf(slider.value)
    }
  
  func startNewRound() {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = "\(targetValue)"
  }


    
}

