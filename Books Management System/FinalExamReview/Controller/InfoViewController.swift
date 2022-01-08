//
//  InfoViewController.swift
//  FinalExamReview
//
//  Created by english on 2021-12-06.
//

import UIKit

class InfoViewController: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var updateMode : Bool = false
    var SelectedBook : Book?
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    
    
    @IBAction func btnSaveOnClick(_ sender: Any) {
        if updateMode {
            if txtTitle.text?.count != 0 {
                SelectedBook!.title = txtTitle.text!
            
                if SelectedBook!.save(context: context) != nil{
                navigationController?.popViewController(animated: true)
            }
            else{
                Toast.ok(view: self, title: " Error ", message: "Something went wrong")
            }
            }
            else{
                Toast.ok(view: self, title: "Enter something", message: "Enter a title")
            }
        }
        else{
            let newBook = Book(context: context)
            if txtTitle.text?.count != 0 {
                newBook.title = txtTitle.text!
            
            if newBook.save(context: context) != nil{
                navigationController?.popViewController(animated: true)
            }
            else{
                Toast.ok(view: self, title: " Error ", message: "Something went wrong")
            }
            }
            else{
                Toast.ok(view: self, title: "Enter something", message: "Enter a title")
            }
        }
        
        
        
       
    }
    
    
    @IBAction func btnDeleteOnClick(_ sender: Any) {
        SelectedBook?.delete(context: context)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if updateMode {
            btnDelete.isHidden = false
        }
        else{
            btnDelete.isHidden = true
        }
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
