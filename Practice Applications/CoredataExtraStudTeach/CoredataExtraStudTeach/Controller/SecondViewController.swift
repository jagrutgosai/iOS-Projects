//
//  SecondViewController.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-18.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    var allTeachers : [Teacher] = []
    @IBOutlet weak var listTeacher: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(allTeachers[indexPath.row].name!)\n \(allTeachers[indexPath.row].course!)"
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listTeacher.delegate = self
        listTeacher.dataSource = self
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
