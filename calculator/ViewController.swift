//
//  ViewController.swift
//  calculator
//
//  Created by Tommy Susanto on 10/05/2016.
//  Copyright © 2016 Tommy Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result: String = ""
    var resultDbl: Double = 0.0
    var operationClicked: Bool = false
    var decimalEntered: Bool = false
    var operationSelected: String = ""
    
    @IBOutlet weak var txtResult: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func zero(sender: AnyObject) {
        //zero
        addNumber(0)
    }
    @IBAction func one(sender: AnyObject) {
        //one
        addNumber(1)
    }
    @IBAction func two(sender: AnyObject) {
        //two
        addNumber(2)
    }
    @IBAction func three(sender: AnyObject) {
        //three
        addNumber(3)
    }
    @IBAction func four(sender: AnyObject) {
        //four
        addNumber(4)
    }
    
    @IBAction func five(sender: AnyObject) {
        //five
        addNumber(5)
    }
    @IBAction func six(sender: AnyObject) {
        //six
        addNumber(6)
    }
    
    @IBAction func seven(sender: AnyObject) {
        //seven
        addNumber(7)
    }
    
    @IBAction func eight(sender: AnyObject) {
        //eight
        addNumber(8)
    }
    
    @IBAction func nine(sender: AnyObject) {
        //nine
        addNumber(9)
    }
    @IBAction func AC(sender: AnyObject) {
        result=""
        resultDbl = 0.0
        reloadDisplay()
    }
    
    @IBAction func plus(sender: AnyObject) {
        operationSelected = "+"
        calculate(operationSelected)
    }
    @IBAction func minus(sender: AnyObject) {
        operationSelected = "-"
        calculate(operationSelected)
    }
    @IBAction func multiply(sender: AnyObject) {
        operationSelected = "*"
        calculate(operationSelected)
    }
    @IBAction func divide(sender: AnyObject) {
        operationSelected = "/"
        calculate(operationSelected)
    }
    
    @IBAction func equal(sender: AnyObject) {
        calculate(operationSelected)
        operationSelected = ""
    }
    @IBAction func inverse(sender: AnyObject) {
        if let res = Double(result) {
            resultDbl = res
            resultDbl = resultDbl * -1
            result = String(format: resultDbl == floor(resultDbl) ? "%.0f" : "%.10f", resultDbl)
            reloadDisplay()
        }
    }
    @IBAction func percentage(sender: AnyObject) {
        if let res = Double(result){
            resultDbl = res / 100
            result=String(format: resultDbl == floor(resultDbl) ? "%.0f" : "%.2f", resultDbl)
            reloadDisplay()
        }
    }
    @IBAction func decimal(sender: AnyObject) {
        if result.rangeOfString(".") == nil{
            result="\(result)."
            reloadDisplay()
        }
    }
    
    func calculate(operation: String){
        
        if operationClicked == false {
            resultDbl = Double(result)!
            resetDisplay()
            operationClick()
        } else {

            if let res = Double(result) as Double! {
                switch operation {
                case "+":
                    resultDbl = resultDbl + res
                case "-":
                    resultDbl = resultDbl - res
                case "*":
                    resultDbl = resultDbl * res
                case "/":
                    resultDbl = resultDbl / res
                default:
                    break
                }
                result = String(format: resultDbl == floor(resultDbl) ? "%.0f" : "%.10f", resultDbl)
                operationClick()
                reloadDisplay()
            }
        }
    }
    
    func operationClick(){
        operationClicked = !operationClicked
    }
    
    func addNumber(input: Int){
        result="\(result)\(String(input))"
        reloadDisplay()
    }
    
    func reloadDisplay(){
        txtResult.text = "\(result)"
    }
    func resetDisplay(){
        result=""
    }
    
    

}

