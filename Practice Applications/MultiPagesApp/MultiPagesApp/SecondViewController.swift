//
//  SecondViewController.swift
//  MultiPagesApp
//
//  Created by english on 2021-09-28.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnGoToFirstViewDismissTouchUp(_ sender: Any) {
        // We need to kill the current view and get back to previous view
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func goToFirstView(_ sender: Any) {
        //Perform the segue like the first button
        performSegue(withIdentifier: "toFirstView", sender: nil)
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
