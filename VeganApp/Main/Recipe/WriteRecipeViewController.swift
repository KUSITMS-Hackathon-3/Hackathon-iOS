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
    @IBOutlet weak var cookTimeTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    let grayColor: UIColor = UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1.0)
    @IBOutlet weak var registerButton: UIBarButtonItem!
    
    weak var delegate: WriteRecipeViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.registerButton.isEnabled = false
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let ingredients = self.ingredientsTextField.text else { return }
        guard let veganLevel = self.veganLevelTextField.text else { return }
        guard let cookTime = Int(self.cookTimeTextField.text ?? "0") else { return }
//        guard let steps = self.contentsTextView.text else { return }
        
        let recipe = Recipe(title: title, ingredients: [], veganLevel: veganLevel, cookTime: cookTime, steps: [], recipeImageUrl: "")
        self.delegate?.didSelectRegister(recipe: recipe)
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension WriteRecipeViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.contentsTextView.text.isEmpty {
            self.contentsTextView.text =  "습관 내용을 입력해주세요."
            self.contentsTextView.textColor = self.grayColor
            
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.contentsTextView.textColor == self.grayColor {
            self.contentsTextView.text = nil
            self.contentsTextView.textColor = UIColor.black
        }
    }
    func textViewDidChange(_ textView: UITextView) {
//        self.validateInputField()
    }
}
