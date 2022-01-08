//
//  ViewController.swift
//  BMI_2031152
//
//  Created by english on 2021-09-14.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBAction func txtHCHanged(_ sender: Any) {
        lblResult.isHidden=true
    }
    
    @IBOutlet weak var btnOutlet: UIButton!
    @IBAction func txtWChanged(_ sender: Any) {
        lblResult.isHidden=true
    }
    @IBOutlet weak var txtHeight: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    
    
    
    
    @IBOutlet weak var lblResult: UILabel!
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        
        
        
        guard let heightstr : String = txtHeight.text, let weightstr : String = txtWeight.text,let weight : Double = Double(weightstr),let height : Double = Double(heightstr)
        else{
            Toast.ok(view: self, title: "Information", message: "Enter Valid Values!!!", handler: nil)
            return
            
        }
                
                        let heightInMeters = Double(height)/100
                        var bmi = weight / (heightInMeters * heightInMeters)
                        bmi = round(bmi * 10) / 10
                        let classificationDescription : Array<String> = ["Underweight", "Normal weight", "Overweight", "Obesity",
                                                                         "BMI out of range (check data)"]
                        let classificationRange : Array<Range<Double>> = [0..<18.5, 18.5..<25.0, 25.0..<30.0, 30.0..<100.1,
                                                                          100.1..<Double.greatestFiniteMagnitude]
                        //let classificationColor : Array<String> = [".red",".green",".yellow",".orange"]
                        
                        for c in 0..<classificationRange.count {
                            if (classificationRange[c].contains(bmi)) {
                                lblResult.text = (" - Classification : \(classificationDescription[c])")
                                if classificationDescription[c] == "Underweight"
                                {
                                    lblResult.backgroundColor = .blue
                                }
                                else if classificationDescription[c] == "Normal weight"
                                {
                                    lblResult.backgroundColor = .green
                                }
                                else if classificationDescription[c] == "Overweight"
                                {
                                    lblResult.backgroundColor = .yellow
                                }
                                else{
                                    lblResult.backgroundColor = .orange
                                    
                                }
                                
                                break
                            }
                        }
                        lblResult.isHidden=false;
                        
                        
                        //lblResult.text = "\(String(bmi)) is your BMI."
                        
                        //lblResult.backgroundColor = classificationColor[c]
                    }
                    
                
            
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnOutlet.layer.cornerRadius = 10
        lblResult.isHidden=true
        // Do any additional setup after loading the view.
    }
    
    
}

