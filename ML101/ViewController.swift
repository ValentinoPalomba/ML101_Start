//
//  ViewController.swift
//  ML101
//
//  Created by Giuseppe Giaquinto on 30/03/2020.
//  Copyright © 2020 Giuseppe Giaquinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var rectSfumato: UIView!
    @IBOutlet weak var sfondoCani: UIImageView!
    
    @IBOutlet var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rectSfumato.layer.cornerRadius = 31
        rectSfumato.clipsToBounds = true
        rectSfumato.layer.masksToBounds = false
        rectSfumato.layer.shadowRadius = 9
        rectSfumato.layer.shadowOpacity = 0.5
        rectSfumato.layer.shadowOffset = CGSize(width: 2, height: 2)
        rectSfumato.layer.shadowColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil , message: nil, preferredStyle: .actionSheet)
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            else {
                print("Camera not avaiable!")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        picker.dismiss(animated: true, completion: nil) 
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showResultsLabel(){
        self.resultsLabel.alpha = 1.0
    }

  
    
    
}

