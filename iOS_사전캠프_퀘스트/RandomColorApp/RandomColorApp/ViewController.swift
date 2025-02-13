//
//  ViewController.swift
//  RandomColorApp
//
//  Created by shinyoungkim on 2/13/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var changeColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "R: 255, G: 255, B: 255"
        
        resetButton.setTitle("Reset", for: UIControl.State.normal)
        resetButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        changeColorButton.setTitle("Change Color", for: UIControl.State.normal)
        changeColorButton.backgroundColor = UIColor.black
        changeColorButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
    }
    
    @IBAction func changeColorButtonPressed(_ sender: UIButton) {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
        mainView.backgroundColor = randomColor
        
        mainLabel.text = "R: \(Int(randomRed * 255)), G: \(Int(randomGreen * 255)), B: \(Int(randomBlue * 255))"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        mainView.backgroundColor = UIColor.white
        mainLabel.text = "R: 255, G: 255, B: 255"
    }
    

}

