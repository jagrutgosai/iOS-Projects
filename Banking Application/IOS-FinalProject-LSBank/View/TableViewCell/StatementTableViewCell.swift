//
//  StatementTableViewCell.swift
//  IOS-FinalProject-LSBank
//
//  Created by english on 2021-11-25.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var imagetransaction: UIImageView!
    @IBOutlet weak var lblAccountHolder: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    static let identifier = "StatementTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName:identifier,bundle: nil)
    }
    
    func setCellContent(dateTime : String,accountHolder : String,amount: Double, credit: Bool, message : String){
        if credit {
            lblAccountHolder.text = "FROM \(accountHolder.uppercased())"
            imagetransaction.image = UIImage(systemName: "arrow.down")
            imagetransaction.tintColor = .green
        }else{
            lblAccountHolder.text = "TO \(accountHolder.uppercased())"
            imagetransaction.image = UIImage(systemName: "arrow.up")
            imagetransaction.tintColor = .red
        }
        lblDate.text = dateTime
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
