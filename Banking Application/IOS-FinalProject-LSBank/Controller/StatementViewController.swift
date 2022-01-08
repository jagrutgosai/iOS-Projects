//
//  StatementViewController.swift
//  IOS-FinalProject-LSBank
//
//  Created by english on 2021-12-02.
//

import UIKit

class StatementViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var transactionDays : Int = 30
    var refreshControl = UIRefreshControl()
    var recentTransactions :[TransactionsStatementTransaction]=[]
    @IBOutlet weak var lblStatementTransaction: UILabel!
    @IBOutlet weak var btnNbOfDays: UISegmentedControl!
    @IBOutlet weak var tableviewStatements: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    private func initialize(){
        
        tableviewStatements.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
        tableviewStatements.delegate = self
        tableviewStatements.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(tableRefreshControl), for: UIControl.Event.valueChanged)
        tableviewStatements.addSubview(refreshControl)
        refreshRecentTransaction()
        
        
        btnNbOfDays.addTarget(self, action: #selector(btnNbOfDaysChanged), for: .allEvents)
        
        
        
    }
    
    @objc func btnNbOfDaysChanged(send : UISegmentedControl ) {
        

        self.transactionDays = (btnNbOfDays.selectedSegmentIndex * 30) + 30
//
//        if btnNbOfDays.isEnabledForSegment(at: 0){
//            transactionDays = 7
//        }
//        else if btnNbOfDays.isEnabledForSegment(at: 1){
//            transactionDays = 30
//        }
//        else if btnNbOfDays.isEnabledForSegment(at: 2){
//            transactionDays = 60
//        }
        refreshRecentTransaction()
        
        
    }
    
    @objc func tableRefreshControl(send : UIRefreshControl) {
        
        DispatchQueue.main.async {
            print("Refreshing table")
            self.refreshRecentTransaction()
            self.refreshControl.endRefreshing()
        }
        
    }
    func refreshRecentTransaction(){
        LSBankAPI.statement(token: LoginViewController.token, days: transactionDays, successHandler: refreshRecentTransactionsSuccess, failHandler: refreshRecenTransactionsFail)
        
        
    }
    func refreshRecentTransactionsSuccess(httpStatusCode : Int, response : [String:Any] ){
        
        DispatchQueue.main.async {
            
        }
        
        if httpStatusCode == 200 {
            
            if let transactions = TransactionStatement.decode(json: response){
                
                DispatchQueue.main.async {
                    self.recentTransactions =  transactions.statement
                    self.tableviewStatements.reloadData()
                }
                
            }
        } else {
            DispatchQueue.main.async {
                Toast.show(view: self, title: "Something went wrong!", message: "Error parsing data received from server! Try again!")
            }
        }
        
    }
    func refreshRecenTransactionsFail( httpStatusCode : Int, message : String ){
        
        DispatchQueue.main.async {
            Toast.show(view: self, title: "Ooops!", message: message)
        }
        
    }
    
    
    
    @IBAction func btnBackOnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(recentTransactions.count == 0){
            lblStatementTransaction.text = "0 Recent Transaction"
        }
        else{ if recentTransactions.count == 1{
            lblStatementTransaction.text = " 1 Recent Transaction"
        }
        else{
            lblStatementTransaction.text = "\( recentTransactions.count) Recent Transactions"
        }
        
        }
        return recentTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier,for:indexPath)as! TransactionTableViewCell
        let transaction = self.recentTransactions[(self.recentTransactions.count - 1) - (indexPath.row)]
        var accountHolderName : String = ""
        var credit : Bool = true
        
        if LoginViewController.account!.accountId.contains(transaction.fromAccount!.accountId){
            credit = false
            accountHolderName = "\(transaction.toAccount!.firstName.uppercased()) + \(transaction.toAccount!.lastName.uppercased())"
        }
        else{
            credit = true
            accountHolderName = "\(transaction.fromAccount!.firstName.uppercased()) + \(transaction.fromAccount!.lastName.uppercased())"
        }
        
        cell.setCellContent(dateTime: transaction.dateTime , accountHolder: accountHolderName, message: transaction.message, amount: transaction.amount, credit: credit)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let transaction = self.recentTransactions[(self.recentTransactions.count - 1) - (indexPath.row)]
        if transaction.message.count == 0{
            return 68
        }
        else{
            return 102
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
