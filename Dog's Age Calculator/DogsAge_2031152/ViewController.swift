//
//  ViewController.swift
//  DogsAge_2031152
//
//  Created by english on 2021-09-07.
//

import UIKit

class ViewController:
    UIViewController {
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    @IBOutlet weak var txtAge: UITextField!
    
    
    //@IBAction func txtAgeChanged(_ sender: Any) {
        
       // lblResult.isHidden=true;
        
    //}
    
    @IBAction func txtvaluechanged(_ sender: Any) {
        lblResult.isHidden=true;    }
    
    @IBAction func btnCheckItOut(_ sender: Any) {
        
        
        //lblResult.isHidden = false;
        
        if let txtAgeString : String = txtAge.text {
            if let myDogAge : Int = Int(txtAgeString){
                if (myDogAge < 0 || myDogAge > 20)
                {
                    Toast.ok(view: self, title: "Information", message: "\(txtAgeString) is not in the range(0-20)", handler: nil)
                }
                else{
                    
                    let dogsAgeInHumanAge = myDogAge*7;
                    lblResult.text = "If your \(txtAgeString) years old dog were a human, he/she would have been \(String(dogsAgeInHumanAge)) years old."
                    lblResult.isHidden=false
                }
                
            } else {
                Toast.ok(view: self, title: "Information", message: "\(txtAgeString) is not a valid age.", handler: nil)

            }
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.isHidden = true;
        // Do any additional setup after loading the view.
    }


}

