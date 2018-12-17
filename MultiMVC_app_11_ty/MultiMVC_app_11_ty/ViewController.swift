//
//  ViewController.swift
//  MultiMVC_app_11_ty
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealText: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clicked(_ sender: Any) {
    }
    
//    @IBAction func selectImageFromPhotoList(_ sender: UITapGestureRecognizer) {
//        self.view.backgroundColor = UIColor.red
//        mealText.resignFirstResponder()
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        present(imagePickerController,animated: true,completion: nil)
//    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageFromPhotoList(_ sender: UITapGestureRecognizer) {
        self.view.backgroundColor = UIColor.red
        mealText.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected asd :\(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

