//
//  QuestionTableViewCell.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by english on 2021-10-14.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    static let indentifier : String = "QuestionTableViewCell"
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var lblExtraInfo: UITextView!
    
    @IBOutlet weak var imgAns: UIImageView!
    
    // Will return nib for all cells in our tableview
    //Layout inflator
    static func nib()  -> UINib
    {
        return UINib(nibName: indentifier, bundle: nil)
    }
    // This function will handle the data ( fill the lblquestion, lblextrainfo and imganswer on this nib.)
    public func setCellContent( question : Question){
        lblQuestion.text=question.question
        lblExtraInfo.text=question.answerExtraInfo
        if question.answer {
            imgAns.image=UIImage(systemName: "checkmark.square" )
            imgAns.tintColor = UIColor.systemBlue
        }
        else{
            imgAns.image=UIImage(systemName: "xmark.square" )
            imgAns.tintColor = UIColor.systemRed
        }
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
