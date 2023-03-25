//
//  WriteCalendarViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/26.
//

import UIKit

class WriteCalendarViewController: UIViewController {
    
    let imagePickerController = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.confirmButton.layer.cornerRadius = 12
        self.memoTextView.layer.cornerRadius = 12
        self.imageView.layer.cornerRadius = 12
        imagePicker.sourceType = .photoLibrary  // 앨범에서 가져옴
        imagePicker.allowsEditing = true        // 수정가능 여부
        imagePicker.delegate = self
        let userDefaults = UserDefaults.standard
        userDefaults.set(3, forKey: "level")
    }
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func tapUploadButton(_ sender: UIButton) {
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension WriteCalendarViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage : UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage    // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage        // 원본 이미지가 있을 경우
        }
        self.imageView.image = newImage
        print(newImage)
        dismiss(animated: true, completion: nil)
    }
}
