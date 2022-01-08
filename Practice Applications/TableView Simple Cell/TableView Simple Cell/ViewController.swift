//
//  ViewController.swift
//  TableView Simple Cell
//
//  Created by english on 2021-10-07.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func btnSaveOnClick(_ sender: Any) {
        
        names.append(txtNameField.text!)
        // Call tablev view to reload the data
        tableView.reloadData()
    }
    @IBOutlet weak var txtNameField: UITextField!
    @IBOutlet weak var txtName: UILabel!
    var names : [String] = ["Daniel", "Gabriel","Catharina","Michelle","Zoe"]
    @IBOutlet weak var tableView: UITableView!
    var selectedRow : Int = -1
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Defines the content for each row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        txtName.text = names[indexPath.row]
        selectedRow = indexPath.row
        
    }

    @IBAction func btnTrashOnClick(_ sender: Any) {
        if selectedRow >= 0
        {
        names.remove(at: selectedRow)
        tableView.reloadData()
            // Returning to initial state
            selectedRow = -1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

