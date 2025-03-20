//
//  ViewController.swift
//  Codepath
//
//  Created by Gabriel Lucchesi on 7/5/23.
//

import UIKit

class ViewController: UIViewController {

    // Store previous colors for undo functionality
    var colorHistory: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }

    @IBAction func changeBackground(_ sender: UIButton) {
        // Save the current background color before changing it
        if let currentColor = view.backgroundColor {
            colorHistory.append(currentColor)
        }

        let randomColor = changeColor()
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = randomColor
        }
    }

    @IBAction func undoBackground(_ sender: UIButton) {
        if let lastColor = colorHistory.popLast() { // Get the last stored color
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor = lastColor
            }
        }
    }
}
