//
//  ViewController.swift
//  AlertDialog
//
//  Created by english on 2021-09-23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alertTypeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return alertTypeList[row]
    }
    let alertTypeList : [String] = ["Alert","Action Sheet"]
    
    
    @IBOutlet weak var styleList: UIPickerView!
    
    
    
    func deleteFile(){
        print("File Deleted!")
    }
    func donotdeleteFile(){
        print("Don't shoot, I'm putting the file down.")
    }
    @IBAction func btnShowDialog(_ sender: Any) {
        var selectedStyle : UIAlertController.Style
        if styleList.selectedRow(inComponent: 0)==0{
            selectedStyle = UIAlertController.Style.alert
        }else{
            selectedStyle = UIAlertController.Style.actionSheet
        }
        let alert = UIAlertController(title: "Confirmation", message: "Do you really want to delete this file?", preferredStyle:selectedStyle)
    
    let btnYes = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {action in  self.deleteFile()
    })
        let btnNo = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: {action in  self.donotdeleteFile()
        })
        
        alert.addAction(btnNo)
        alert.addAction(btnYes)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleList.delegate=self
    }


}

