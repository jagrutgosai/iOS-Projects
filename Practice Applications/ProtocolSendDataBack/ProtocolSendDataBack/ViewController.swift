//
//  ViewController.swift
//  ProtocolSendDataBack
//
//  Created by english on 2021-11-02.
//

import UIKit



class ViewController: UIViewController , Messages {
   
    

    
    @IBOutlet weak var txtMsgBx1: UITextField!
    
    @IBOutlet weak var lblTxtRecieve: UILabel!
    
    
   
    @IBAction func btnSendOnClick(_ sender: Any) {
        guard let message = txtMsgBx1.text else {
            print("Something wrong")
            return
        }
        if message.count==0{
            print("Enter something to send!")
            return
        }
        performSegue(withIdentifier: Segue.toSecondView, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = (segue.destination as! SecondViewController)
        secondView.message = txtMsgBx1.text!
        secondView.delegate = self
        // Self here means that the delegate can know where to find the implementation
    }
    func sendMessage(message: String) {
        lblTxtRecieve.text = message
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }


}

