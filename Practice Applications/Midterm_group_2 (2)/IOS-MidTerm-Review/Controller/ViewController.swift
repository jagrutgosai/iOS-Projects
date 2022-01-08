//
//  ViewController.swift
//  IOS-MidTerm-Review
//
//  Created by user203275 on 10/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName : UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblPrompt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPassword.isSecureTextEntry = true
    }


    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toStudentList {
        
            guard let name : String = txtName.text else {
                print("Please, enter a valid name!")
                return false
            }
            guard let pwd : String = txtPassword.text else {
                print("Please, enter a valid password!")
                return false
            }
            
            if name != "2031152" {
                
                lblPrompt.text="Invalid username (7/8 digits)"
                return false
            }
            if pwd != "adm123" {
                lblPrompt.text="Invalid password"
                
                return false
            }
            return true
        
        }
        
        return false
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toStudentList {
        
            let studentList = (segue.destination as! StudentListViewController)
            studentList.userName = txtName.text!
        }
        
        
    }
   

}

