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
  @IBOutlet weak var startOverButton: UIButton!
  
 

    override func viewDidLoad() {
        super.viewDidLoad()
      self.startNewRound()
      
      let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
      slider.setThumbImage(thumbImageNormal, for: .normal)
      
      let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
      slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
      let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
      
      let trackLeftImage = UIImage(named: "SliderTrackLeft")!
      let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
      slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
      let trackRightImage = UIImage(named: "SliderTrackRight")!
      let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
      slider.setMaximumTrackImage(trackRightResizable, for: .normal)
      
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
      
      var points = 100 - difference
      score += points
      round += 1
      
      let title: String
      if difference == 0 {
        title = "Perfect !"
        points += 100
      } else if difference < 5 {
        if difference == 1 {
          points += 50
        }
        title = "You alomost had it !"
      } else if difference < 10 {
        title = "Pretty Good!"
      } else {
        title = "Not even close ..."
      }
 
      
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
      let action = UIAlertAction(title: "OK", style: .default) { (_ ) in
        self.startNewRound()
      }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
      
      
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
      currentValue = lroundf(slider.value)
    }
  
  @IBAction func touchUpInsideStartOver( _ button: UIButton) {
    score = 0
    round = 0
    startNewRound()
    
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = 1
//    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunction.easeOut)
    view.layer.add(transition, forKey: nil)
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

