//
//  ProfileViewController.swift
//  ProfilePicUsingGestureNProtocol
//
//  Created by english on 2021-11-02.
//

import UIKit

protocol ProfilePicture{
    func sendProfilePicture(image : UIImage?)
}

class ProfileViewController: UIViewController {
    public var delegate : ProfilePicture?
    @IBOutlet var images : [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    func initialize(){
       // imgProfile.layer.cornerRadius = 100
        
        for image in images {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(tapRecognizer)
        }
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
       //print("Image Tapped!")
        let imageTapped = tapGestureRecognizer.view as! UIImageView
        delegate!.sendProfilePicture(image: imageTapped.image)
        navigationController?.popViewController(animated: true)
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
