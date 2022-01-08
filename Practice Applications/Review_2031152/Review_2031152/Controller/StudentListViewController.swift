//
//  StudentListViewController.swift
//  Review_2031152
//
//  Created by english on 2021-10-19.
//

import UIKit


// To work with UITableView, you need to implement UITableViewDelegate & UITableView DataSource

class StudentListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , TableViewRefresh{
    func refresh() {
        tablevView.reloadData()
    }
    
    
    private var selectedRow : Int = 0
    public var sName : String = ""
    @IBOutlet weak var lblStudentName: UILabel!
    
    @IBOutlet weak var tablevView: UITableView!
    @IBAction func btnAddOnClick(_ sender: Any) {
    }
    
    @IBAction func btnRefreshOnClick(_ sender: Any) {
        tablevView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        StudentProvider.addStudent(student: Student( id:1, name: "Daniel"))
//        StudentProvider.addStudent(student: Student( id:2, name: "Jagrut"))
//        StudentProvider.addStudent(student: Student( id:3, name: "Gabriel"))

        lblStudentName.text = sName
        tablevView.delegate = self
        tablevView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentProvider.allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = StudentProvider.allStudents[indexPath.row].name
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        
        // Call a segue to open StudentInfoViewController in 'Edit Mode'
        performSegue(withIdentifier: Segue.toStudentEdit, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toStudentEdit {
            let studentInfo =  ( segue.destination as! StudentInfoViewController)
            studentInfo.selectedStudent = StudentProvider.allStudents[selectedRow]
            studentInfo.selectedRw = self.selectedRow
            
            
            
            
            
            
          
        }
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
