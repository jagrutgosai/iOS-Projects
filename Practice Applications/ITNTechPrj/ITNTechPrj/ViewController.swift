//
//  ViewController.swift
//  ITNTechPrj
//
//  Created by english on 2021-09-30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnLoginOnClick(_ sender: Any) {
        
        
        
        // PerformSegue
        
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let email : String = txtEmail.text, let password : String = txtPassword.text
        else{
            print("There is a problem with your credentials")
            return false
        }
        //        if email.count==0{
        //            txtEmail.backgroundColor = UIColor.yellow
        //            return
        //        }
        if email == "admin@int4fc.com" && password == "Lasalle2000"
        {
            //performSegue(withIdentifier: "toSecondView", sender: nil)
            return true
        }
        else{
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            
            let secondViewController = segue.destination as! SecondViewController
            
            guard let email = txtEmail.text else {
                return
            }
            secondViewController.Emailid = email
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

