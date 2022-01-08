//
//  ViewController.swift
//  UnwindSegue
//
//  Created by english on 2021-11-11.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! ThirdViewController
        // Use data from the view controller which initiated the unwind segue
        print(sourceViewController.username)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

