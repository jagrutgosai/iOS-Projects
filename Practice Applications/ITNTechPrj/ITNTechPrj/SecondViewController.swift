//
//  SecondViewController.swift
//  ITNTechPrj
//
//  Created by english on 2021-09-30.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var Emailid : String=""
    
    
    
    @IBAction func btnIMGClick(_ sender: Any) {
        
        performSegue(withIdentifier: "toThirdView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdView" {
        
            let thirdViewController = segue.destination as! ThirdViewController
            
            
            thirdViewController.EmailIden = Emailid
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = Emailid
        
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
//        let temp = navigationArray.first
        navigationArray.remove(at: 0)
//        navigationArray.removeAll()
//        navigationArray.append(temp!) //To remove all previous UIViewController except the last one
        self.navigationController?.viewControllers = navigationArray
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
