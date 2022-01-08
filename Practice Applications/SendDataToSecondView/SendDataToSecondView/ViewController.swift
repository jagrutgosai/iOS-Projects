//
//  ViewController.swift
//  SendDataToSecondView
//
//  Created by english on 2021-09-28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func txtMessageChanged(_ sender: Any) {
        txtMessage.backgroundColor = UIColor.red
    }
    @IBOutlet weak var txtMessage: UITextField!
    
    @IBAction func btnSendMessage(_ sender: Any) {
        guard let message : String = txtMessage.text
        else{
            print("There is a problem with your message")
            return
        }
        if message.count==0{
            txtMessage.backgroundColor = UIColor.yellow
            return
        }
        // PerformSegue
       
        performSegue(withIdentifier: "toSecondView", sender: nil)
        
        
        
        
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toSecondViewSecondSegue"{
            guard let message : String = txtMessage.text
            else{
                print("There is a problem with your message")
                return false
            }
            if message.count==0{
                txtMessage.backgroundColor = UIColor.yellow
                return false
        }
            
    }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" || segue.identifier == "toSecondViewSecondSegue"{
        
            let secondViewController = segue.destination as! SecondViewController
            
            guard let message = txtMessage.text else {
                return
            }
            secondViewController.Data = message
        }
    }
}

