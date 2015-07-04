//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Richard Gambord on 7/3/15.
//  Copyright (c) 2015 bitfountain-student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var balloonCount: UILabel!
  @IBOutlet weak var balloonLabel: UILabel!
  
  var balloons:[Balloon] = []
  var myImages:[String] =
  ["RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg", ]
  var arrayIndex = 0
  var randomIndex = 0
  var previousRandomIndex = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // load the images
    loadImages()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func loadImages() {
    // TODO Load images into array
    
    for var myIndex = 0; myIndex < 99; ++myIndex
    {
      var myImage = ""
      
      // Select a random non-repeating random index
      do {
        randomIndex = Int(arc4random_uniform(UInt32(4)))
      } while randomIndex == previousRandomIndex
      previousRandomIndex = randomIndex
      
      switch randomIndex {
      case 0:
        myImage = "RedBalloon1.jpg"
      case 1:
        myImage = "RedBalloon2.jpg"
      case 2:
        myImage = "RedBalloon3.jpg"
      case 3:
        myImage = "RedBalloon4.jpg"
      default:
        myImage = "BerlinTVTower.jpg"
      }
      balloons.append(Balloon())  // create a new balloon instance
      balloons[myIndex].image = UIImage(named: myImage)
      balloons[myIndex].count = myIndex
    }
  }
  
  @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {
    
    
    
    // TODO Add picture selector
    println("\(arrayIndex)")
    balloonCount.text = "\(balloons[arrayIndex].count + 1)"
    balloonCount.hidden = false
    balloonLabel.hidden = false
    myImageView.image = balloons[arrayIndex].image
    arrayIndex = arrayIndex < 98 ? ++arrayIndex : 0 // increment arrayIndex
    
  }
  
}

