//
//  ViewController.swift
//  перевод чисел
//
//  Created by Юрий  Парфенов on 13/11/2018.
//  Copyright © 2018 Юрий  Парфенов. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate{
    
    var DigitInt: Int64 = 0
    var modulo: Int64 = 0
    var result: String = ""
    var Rresult: String = ""
    var DigitStr: String = ""
    
    var ArrayInt = [Int64]()
    var lenght : Int64 = 0
    var result2: Int64 = 0
    
    func NilCheck(){
        if Digit.text!.isEmpty{
            MainLabel.text = "Field is not filled"
        }else{
            if Int64(Digit.text!) != nil{
                DigitInt = Int64(Digit.text!)!
            }else{
                MainLabel.text = "Error"
            }
        }
    }
    
    func calculaton(){
        
        DigitStr = String(DigitInt)
        
        ArrayInt = DigitStr.compactMap{Int64(String($0))}
        
        lenght = Int64(ArrayInt.count)
        
        if From10to2Btn.isHighlighted{
            
            while DigitInt > 0{
                
                modulo = DigitInt % Int64(2)
                
                result = result + String(modulo)
                
                DigitInt = (DigitInt - modulo) / 2
                
                Rresult = String(result.reversed())
                
            }
            MainLabel.text = Rresult
            NilCheck()
            
        }else if From2to10Btn.isHighlighted{
            
            if lenght == 1{
                if DigitStr == "0"{
                    MainLabel.text = "0"
                    NilCheck()
                }else if DigitStr == "1"{
                    MainLabel.text = "1"
                    NilCheck()
                }else{
                    MainLabel.text = "number is not a binary system"
                }
            }else{
                
                for (index, element) in ArrayInt.enumerated(){
                    
                    if element == 0 || element == 1{
                        
                        result2 = result2 + element * Int64(pow(2,(Double(lenght - Int64(index) - Int64(1)))))
                        
                        MainLabel.text = String(result2)
                        NilCheck()
                    }else{
                        MainLabel.text = "number is not a binary system"
                        
                        NilCheck()
                    }
                }
                
            }
            
        }
    }
    
    func ClearAll(){
        
        MainLabel.text = "0"
        modulo = 0
        result = ""
        Rresult = ""
        DigitStr = ""
        ArrayInt.removeAll()
        lenght  = 0
        result2 = 0
    }
    
    @IBAction func ClearBtn(_ sender: UIButton) {
        
        ClearAll()
        Digit.text = ""
        
    }
    
    @IBAction func From10to2(_ sender: UIButton) {
        if MainLabel.text == "0" {
            NilCheck()
            calculaton()
        }else{
            ClearAll()
            NilCheck()
            calculaton()
        }
    }
    
    @IBAction func From2to10(_ sender: UIButton){
        if MainLabel.text == "0"{
            NilCheck()
            calculaton()
        }else{
            ClearAll()
            NilCheck()
            calculaton()
        }
    }
    
    @IBOutlet weak var From10to2Btn: UIButton!
    
    @IBOutlet weak var From2to10Btn: UIButton!
    
    @IBOutlet weak var MainLabel: UILabel!
    
    @IBOutlet weak var Digit: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Digit.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Digit.delegate = self
        
    }
}

