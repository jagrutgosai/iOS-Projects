//
//  StudentInfoViewController.swift
//  Review_2031152
//
//  Created by english on 2021-10-19.
//

import UIKit

protocol TableViewRefresh {
    
    func refresh()
    
    
}

class StudentInfoViewController: UIViewController {

    public var delegate : TableViewRefresh?
    public var selectedRw : Int = 0
    public var selectedStudent : Student? // ? = This object can be nil/null
    private var editMode : Bool = false
    @IBOutlet weak var btnDelete: UIButton!
    
    
    @IBAction func btnDeleteOnClick(_ sender: Any) {
       // StudentProvider.allStudents.remove(at: selectedRw)
        StudentProvider.removeStudent(sid: selectedStudent!.id)
        delegate?.refresh()
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnSaveOnClick(_ sender: Any) {
        guard let name=txtName.text else{
            print("Inform a valid name!")
            return
        }
        
        if name.count  < 3 {
            print ("Please, enter a name with at least three chars!")
            return
        }
        if editMode{
            selectedStudent!.name = name
            StudentProvider.updateStudent(updatedStudent: selectedStudent!)
        }
        else{
        
        StudentProvider.addStudent(student: Student(id: Student.getNextId(), name: name))
        }
        delegate?.refresh()
        navigationController?.popViewController(animated: true)
        
        
        
    }
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let student = selectedStudent{
            editMode = true
            btnDelete.isHidden = false
            txtName.text = student.name
        }
        else{
            editMode = false
        // If we are in insert mode we don't have delete
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
