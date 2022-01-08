//
//  SecondViewController.swift
//  SendDataToSecondView
//
//  Created by english on 2021-09-28.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text=Data
        // Do any additional setup after loading the view.
    }
    var Data : String=""
    @IBAction func btnGoBackTouchUp(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBOutlet weak var lblMessage: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
