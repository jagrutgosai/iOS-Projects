//
//  ViewController.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-16.
//

import UIKit

class ViewController: UIViewController {
    
    public var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtCourse: UITextField!
    
    @IBAction func btnAddOnClick(_ sender: Any) {
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newTeacher = Teacher(context: self.context)
        newTeacher.name = txtname.text
        newTeacher.course = txtCourse.text
        if let uuid = newTeacher.save(context: self.context){
            if segue.identifier == "toSecondView"{
            
                let teacherList = (segue.destination as! SecondViewController)
                teacherList.allTeachers = Teacher.allByName(context: self.context)
            }
            // print("New teacher Added\(uuid.uuidString)")
                }
                else{
                    print("Problem to Save")
                }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let newTeacher = Teacher(context: self.context)
//        newTeacher.name = "Daniel"
//        newTeacher.course = "iOS Mob Dev"
//        if let uuid = newTeacher.save(context: self.context){
//            print("New teacher Added\(uuid.uuidString)")
//        }
//        else{
//            print("Problem to Save")
//        }
//
//
//        //Updating
//        newTeacher.name = "Zeorug"
//        newTeacher.course = "Web Server App"
//        if let uuid = newTeacher.save(context: self.context){
//            print("Teacher Updated\(uuid.uuidString)")
//        }
//        else{
//            print("Problem to Update")
//        }
//
//        let allTeachers = Teacher.allByName(context: self.context)
//        for teacher in allTeachers {
//            print ("\(teacher.name!) - \(teacher.course!)")
//        }
        
        
//        let newStudent = Student(context: self.context)
//        newStudent.email = "student@gmail.com"
//        newStudent.name = "ark"
//        if let uuid = newStudent.save(context: self.context){
//            print("New Student Saved \(uuid.uuidString)")
//        }
//        else{
//            print("Problem to save")
//        }
//        //updating
//        newStudent.name = "Aark Smith"
//        if let uuid = newStudent.save(context: self.context){
//            print("Student Updated \(uuid.uuidString)")
//        }
//        else{
//            print("Problem to update")
//        }
//
//        let allStudents =  Student.allByName(context: self.context)
//        for student in allStudents {
//            print("\(student.name!) - \(student.uuid!)")
//        }
    }


}

