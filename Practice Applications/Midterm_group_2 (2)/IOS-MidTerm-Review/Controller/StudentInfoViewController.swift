//
//  StudentInfoViewController.swift
//  IOS-MidTerm-Review
//
//  Created by user203275 on 10/17/21.
//

import UIKit


protocol TableViewRefresh {
    /// Protocol to auto-refresh the list - don't touch this code.
    func refresh()
}


class StudentInfoViewController: UIViewController {

    public var selectedStudent : Student?
    public var editMode : Bool = false
    
    var delegate : TableViewRefresh?  /// delegate to auto-refresh the list  - don't touch this code.
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtStudentName : UITextField!
    @IBOutlet weak var btnDelete : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if editMode {
            title = "Showing student"
            btnDelete.isHidden = false
            txtStudentName.text = selectedStudent!.getName()
            txtEmail.text = selectedStudent!.getEmail()
        } else {
            title = "Adding new student"
            btnDelete.isHidden = true
        }
        

    }

    
    @IBAction func btnSave(_ sender: Any) {
        
        if let studentName : String = txtStudentName.text , let studentEmail : String = txtEmail.text{
            
            if studentName.count < 3 {
                print("Please, enter a student name with at least 3 chars!")
                return
            }
            
            if editMode {
                
                selectedStudent!.setName(name: studentName)
                selectedStudent!.setEmail(email: studentEmail)
                
            
            } else {

                let student = Student()
                
                student.setName(name: studentName)
                student.setEmail(email: studentEmail)
                student.setId(id: Student.getNextId())
                
                StudentProvider.addStudent(student: student)

            }
           
            delegate?.refresh()  /// auto-refresh the list - don't touch this code
            
            navigationController!.popViewController(animated: true)
            
            
        } else {
            print("Enter a valid Details!")
        }
        
        
    }
    
    func RemoveStudent()
    {
        StudentProvider.removeStudent(studentId: selectedStudent!.getId())
        
        delegate?.refresh()
        navigationController?.popViewController(animated: true)
    }
    func DoNotRemoveStudent(){
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnDeleteTouchUp(_ sender: Any) {
        let selectedStyle : UIAlertController.Style  = UIAlertController.Style.alert
       
        let alert = UIAlertController(title: "Confirmation", message: "Do you really want to delete " + txtStudentName.text! + "?", preferredStyle:selectedStyle)
    
    let btnYes = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {action in  self.RemoveStudent()
    })
    let btnNo = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: {action in  self.DoNotRemoveStudent()
        })
        
        alert.addAction(btnNo)
        alert.addAction(btnYes)
        present(alert, animated: true, completion: nil)
        
        
       
    }
    


}
