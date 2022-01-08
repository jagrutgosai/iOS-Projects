//
//  ViewController.swift
//  FinalExam(07256)
//
//  Created by english on 2020-12-14.
//  Copyright © 2020 420-DM5-AS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var selectedDog = ""
    var selectedDogId : UUID?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDog = nameArray[indexPath.row]
        selectedDogId = idArray[indexPath.row]
        performSegue(withIdentifier: "ToSaveSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSaveSegue" {
            let des = segue.destination as! SaveViewController
            des.choosenDog = selectedDog
            des.choosenDogId = selectedDogId
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        getData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name:NSNotification.Name("NewDog"),object:nil)
    }
    
    @objc func addButtonPressed(){
        selectedDog = ""
        performSegue(withIdentifier: "ToSaveSegue", sender: nil)
    }

    @objc func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dogs")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0{
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.append(id)
                    }
                    self.tableView.reloadData()
                }
            }
        }
        catch{
            print("Error")
        }
    }

}

