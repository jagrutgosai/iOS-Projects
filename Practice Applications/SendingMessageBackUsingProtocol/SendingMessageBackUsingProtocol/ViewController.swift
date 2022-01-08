//
//  ViewController.swift
//  SendingMessageBackUsingProtocol
//
//  Created by english on 2021-11-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var txtMessageRecieved: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSendMessageTouchUp(_ sender: Any) {
        
        if let msg: String = txtMessage.text{
            
            if msg.count == 0 {
                print("pleaqse enter a message")
                return
            }
            performSegue(withIdentifier: Segue.toSecondView, sender: nil)
            
            
        }else{
            print("Something wrong")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}

