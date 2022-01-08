//
//  ViewController.swift
//  LetNGuard
//
//  Created by english on 2021-09-21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtNum1: UITextField!
    
    @IBOutlet weak var txtNum2: UITextField!
    
    
    
    @IBAction func btnOnClickCalculate(_ sender: Any) {
//        if let number1 : Double = Double(txtNum1.text!),let number2 : Double = Double(txtNum2.text!){
//
//        }
//        else{
//            print("Probelm!")
//        }
        
        guard let number1 : Double = Double(txtNum1.text!),let number2 : Double = Double(txtNum2.text!)
        else{
            print("Probelm!")
            return
        }
        var total = (number1 + number2)
        print(total)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

