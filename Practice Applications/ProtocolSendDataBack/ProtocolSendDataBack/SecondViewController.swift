//
//  SecondViewController.swift
//  ProtocolSendDataBack
//
//  Created by english on 2021-11-02.
//

import UIKit
protocol Messages {
    func sendMessage(message : String)
}

class SecondViewController: UIViewController {

    var message : String = ""
    var delegate : Messages?
    @IBOutlet weak var lblTxtRecieve1stview: UILabel!
    
    @IBOutlet weak var txtMsgSendTo1st: UITextField!
    
    
    @IBAction func btnSendTo1stClick(_ sender: Any) {
        guard let message = txtMsgSendTo1st.text else {
            print("Something wrong")
            return
        }
        if message.count==0{
            print("Enter something to send!")
            return
        }
        
        navigationController?.popViewController(animated: true)
        delegate?.sendMessage(message: message)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTxtRecieve1stview.text = message
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
