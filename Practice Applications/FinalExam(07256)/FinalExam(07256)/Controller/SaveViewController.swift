//
//  SaveViewController.swift
//  FinalExam(07256)
//
//  Created by english on 2020-12-14.
//  Copyright © 2020 420-DM5-AS. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var choosenDog : String = ""
    var choosenDogId : UUID?

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtBreed: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBAction func savePresssed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newDog = NSEntityDescription.insertNewObject(forEntityName: "Dogs", into: context)
        
        newDog.setValue(txtName.text!, forKey: "name")
        newDog.setValue(txtBreed.text!, forKey: "breed")
        
        newDog.setValue(UUID(), forKey: "id")
        
        if let year = Int( txtYear.text!){
            newDog.setValue(year, forKey:"year")
        }
        
        let data = imgView.image?.jpegData(compressionQuality: 0.5)
        newDog.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("Success")
        }
        catch{
            print("Error")
        }
        
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name("newDog"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.isUserInteractionEnabled = true
        let imgTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imgView.addGestureRecognizer(imgTapRecognizer)
    }
    
    @objc func chooseImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated:true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    
    func getDataById() {
        //select * from painting where id = ??
        
        if choosenDog != ""{
        
            btnSave.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dogs")
            let idString = choosenDogId?.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0{
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKeyPath: "name") as? String{
                            txtName.text = name
                        }
                        if let artist = result.value(forKeyPath: "breed") as? String{
                            txtBreed.text = artist
                        }
                        if let year = result.value(forKeyPath: "year") as? Int{
                            txtYear.text = String(year)
                        }
                        if let dataImage = result.value(forKeyPath: "image") as? Data{
                            imgView.image = UIImage(data:dataImage)
                        }
                    }
                }
            }
            catch{
                print("Error")
            }
        }
        else{
            btnSave.isHidden = false
        }
    }
}
