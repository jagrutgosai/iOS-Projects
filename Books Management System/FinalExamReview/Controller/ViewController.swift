//
//  ViewController.swift
//  FinalExamReview
//
//  Created by english on 2021-12-06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if txtName.text?.count == 0 {
            return false
            
        }
        
        return true
    }
    
    
    @IBAction func btnLoginOnClick(_ sender: Any) {
        performSegue(withIdentifier: Segue.toListView, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let LVC = segue.destination as! ListViewController
        if segue.identifier == Segue.toListView  {
            LVC.loggedUsername = txtName.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

