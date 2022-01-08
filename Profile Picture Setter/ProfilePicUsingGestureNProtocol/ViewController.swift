//
//  ViewController.swift
//  ProfilePicUsingGestureNProtocol
//
//  Created by english on 2021-11-02.
//

import UIKit

class ViewController: UIViewController, ProfilePicture {
    
    

    @IBOutlet weak var imgProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialize()
    }
    func initialize(){
        imgProfile.layer.cornerRadius = 100
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(tapRecognizer)
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
       // print("Image Tapped!")
        performSegue(withIdentifier: Segue.toProfileView, sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileView = (segue.destination as! ProfileViewController)
        profileView.delegate=self
    }
    func sendProfilePicture(image: UIImage?) {
        imgProfile.image = image
    }
}

