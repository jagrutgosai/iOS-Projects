//
//  ViewController.swift
//  TAGStackView
//
//  Created by english on 2021-09-21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var switchOpA: UISwitch!
    
    @IBOutlet weak var switchOpB: UISwitch!
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        switch sender.tag {
        case 1:
            if switchOpA.isOn{
                switchOpB.isOn = false;
            }
        case 2:
            if switchOpB.isOn{
                switchOpA.isOn = false;
            }
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

