//
//  ThirdViewController.swift
//  ITNTechPrj
//
//  Created by english on 2021-09-30.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var lblWelcomeEmail: UILabel!
    var EmailIden : String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcomeEmail.text=EmailIden
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
