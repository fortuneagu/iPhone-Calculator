//
//  ViewController.swift
//  iPhone Calculator
//
//  Created by Decagon on 19/07/2021.
//

import UIKit

enum Operations: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operations = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outputLabel.text = "0"
    }
    @IBAction func numberPressed(_ sender: RoundedView) {
        if runningNumber.count <= 11 {
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundedView) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0 "
    }
    
    
    @IBAction func dotPressed(_ sender: RoundedView) {
        if runningNumber.count <= 10 {
            runningNumber +=  "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundedView) {
        operation(operation: currentOperation)
    }
    
    @IBAction func plusPressed(_ sender: RoundedView) {
        operation(operation: .Add)
    }
    
    @IBAction func minusPressed(_ sender: RoundedView) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundedView) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundedView) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operations) {
        if currentOperation != .NULL {
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)! ))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

