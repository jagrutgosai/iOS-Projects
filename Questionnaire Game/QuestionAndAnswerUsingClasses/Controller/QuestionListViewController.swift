//
//  QuestionListViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by english on 2021-10-14.
//

import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // register nib file as a "cell prototype"
        tableView.register(QuestionTableViewCell.nib(), forCellReuseIdentifier: QuestionTableViewCell.indentifier)
        tableView.dataSource=self
        tableView.delegate=self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Provider.allQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.indentifier, for: indexPath) as! QuestionTableViewCell
        customCell.setCellContent(question: Provider.allQuestions[indexPath.row])
        return customCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
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
