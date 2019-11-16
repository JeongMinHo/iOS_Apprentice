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
  var score: Int = 0
  var round: Int = 0

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
 

    override func viewDidLoad() {
        super.viewDidLoad()
      self.startNewRound()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
      
      var difference: Int = 0
      if currentValue > targetValue {
        difference = currentValue - targetValue
      } else if(currentValue < targetValue) {
        difference = targetValue - currentValue
      } else {
        difference = 0
      }
      
      let points = 100 - difference
      score += points
      round += 1
      
      
        let message = "You scored \(points) points"
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
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = "\(targetValue)"
    scoreLabel.text = "\(score)"
    roundLabel.text = "\(round)"
  }


    
}

