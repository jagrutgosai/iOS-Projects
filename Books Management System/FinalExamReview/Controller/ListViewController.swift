//
//  ListViewController.swift
//  FinalExamReview
//
//  Created by english on 2021-12-06.
//

import UIKit

class ListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var loggedUsername : String = ""
    var selectedRow : Int = 0
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblUser: UILabel!
    
    
    
    @IBAction func btnRefreshOnClick(_ sender: Any) {
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblUser.text = loggedUsername
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Book.all(context: context).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        let book = Book.all(context: context)[indexPath.row]
        cell.textLabel!.text = book.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: Segue.toInfoUpdate, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toInfoUpdate{
            let book = Book.all(context: context)[selectedRow]
            let UpdateView = segue.destination  as! InfoViewController
            UpdateView.SelectedBook = book
            UpdateView.updateMode = true
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
