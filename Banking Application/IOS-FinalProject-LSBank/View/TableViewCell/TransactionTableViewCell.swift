//
//  TransactionTableViewCell.swift
//  IOS-FinalProject-LSBank
//
//  Created by english on 2021-11-26.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDateTime: UILabel!
    
    @IBOutlet weak var lblAccountHolder: UILabel!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var imgType: UIImageView!
    
    @IBOutlet weak var lblAmount: UILabel!
    
    static let identifier = "TransactionTableViewCell"
    
    static func nib() ->UINib
    {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setCellContent(dateTime : String,accountHolder:String,message:String,amount:Double,credit:Bool){
        if credit{
            lblAccountHolder.text  =  "FROM \(accountHolder)"
            imgType.image = UIImage(systemName: "arrow.down")
            imgType.tintColor = UIColor.green
        }else{
            
            lblAccountHolder.text  =  "TO \(accountHolder)"
            imgType.image = UIImage(systemName: "arrow.up")
            imgType.tintColor = UIColor.red


            //debit
        }
        lblDateTime.text = dateTime
        lblAmount.text = amount.formatAsCurrency()
        lblMessage.text = message
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
