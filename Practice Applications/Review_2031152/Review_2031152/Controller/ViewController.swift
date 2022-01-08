//
//  ViewController.swift
//  Review_2031152
//
//  Created by english on 2021-10-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.toStudentListView{
            guard let name=txtName.text else{
                print("Inform a valid name!")
                return false
            }
            
            if name.count  < 3 {
                print ("Please, enter a name with at least three chars!")
                return false
            }
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toStudentListView{
            let studentInfo = segue.destination as!
            StudentListViewController
            studentInfo.sName = txtName.text ?? ""
            
        }
    }

}

