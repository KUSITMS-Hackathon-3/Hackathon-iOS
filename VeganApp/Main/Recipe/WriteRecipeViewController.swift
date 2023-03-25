//
//  WriteRecipeViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit

protocol WriteRecipeViewDelegate: AnyObject {
    func didSelectRegister(recipe: Recipe)
}

class WriteRecipeViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var veganLevelTextField: UITextField!
    @IBOutlet weak var hastagTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var confirmButton: UIButton!
    let imagePickerController = UIImagePickerController()
    weak var delegate: WriteRecipeViewDelegate?
    var imageURL: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFieldView()
        self.navigationController?.navigationBar.tintColor = .black
        imagePicker.sourceType = .photoLibrary  // 앨범에서 가져옴
                imagePicker.allowsEditing = true        // 수정가능 여부
                imagePicker.delegate = self
    }
    
    let imagePicker = UIImagePickerController()
    
    
    let grayColor: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    let brownColor: UIColor = UIColor(red: 246/256, green: 246/256, blue: 246/256, alpha: 1.0)
    func configureTextFieldView() {
        self.titleTextField.layer.cornerRadius = 12
        self.ingredientsTextField.layer.cornerRadius = 12
        self.veganLevelTextField.layer.cornerRadius = 12
        self.hastagTextField.layer.cornerRadius = 12
        self.contentsTextView.layer.cornerRadius = 12
        
        self.titleTextField.layer.borderWidth = 1
        self.ingredientsTextField.layer.borderWidth = 1
        self.veganLevelTextField.layer.borderWidth = 1
        self.hastagTextField.layer.borderWidth = 1
        self.contentsTextView.layer.borderWidth = 1
        self.uploadButton.layer.cornerRadius = 12
        self.confirmButton.layer.cornerRadius = 12
        self.uploadButton.layer.borderWidth = 1
        self.uploadButton.layer.borderColor = self.grayColor.cgColor
        self.titleTextField.layer.borderColor = self.grayColor.cgColor
        self.ingredientsTextField.layer.borderColor = self.grayColor.cgColor
        self.veganLevelTextField.layer.borderColor = self.grayColor.cgColor
        self.hastagTextField.layer.borderColor = self.grayColor.cgColor
        self.contentsTextView.layer.borderColor = self.grayColor.cgColor
        
        self.titleTextField.backgroundColor = self.brownColor
        self.ingredientsTextField.backgroundColor = self.brownColor
        self.veganLevelTextField.backgroundColor = self.brownColor
        self.hastagTextField.backgroundColor = self.brownColor
        self.contentsTextView.backgroundColor = self.brownColor
    }
    
    @IBAction func tapConfirmButton(_ sender: UIButton) {
        guard let title = self.titleTextField.text else { return }
        guard let ingredients = self.ingredientsTextField.text else { return }
        guard let veganLevel = self.veganLevelTextField.text else { return }
        guard let hashtag = self.hastagTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let imageURL = self.imageURL else { return }
        let recipe = Recipe(title: title, ingredients: ingredients, veganLevel: veganLevel, steps: contents, recipeImageUrl: imageURL, hashtag: hashtag)
        self.delegate?.didSelectRegister(recipe: recipe)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapUploadButton(_ sender: UIButton) {
        self.present(imagePicker, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension WriteRecipeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage : UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage    // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage        // 원본 이미지가 있을 경우
        }
        self.imageURL = newImage
        print(newImage)
        dismiss(animated: true, completion: nil)
    }
}
