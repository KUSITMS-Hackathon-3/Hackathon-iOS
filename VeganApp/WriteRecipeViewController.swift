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
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var levelTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    let grayColor: UIColor = UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1.0)
    @IBOutlet weak var registerButton: UIBarButtonItem!
    
    weak var delegate: WriteRecipeViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerButton.isEnabled = false
    }
    
    private func validateInputField() {
        self.registerButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.ingredientTextField.text?.isEmpty ?? true) && !(self.levelTextField.text?.isEmpty ?? true) && !(self.timeTextField.text?.isEmpty ?? true)
    }
    
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let ingredient = self.ingredientTextField.text else { return }
        guard let level = self.levelTextField else { return }
        guard let time = self.timeTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        self.delegate?.didSelectRegister(recipe: recipe)
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension WriteRecipeViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.recipeTextView.text.isEmpty {
            self.recipeTextView.text =  "습관 내용을 입력해주세요."
            self.recipeTextView.textColor = self.grayColor
            
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.recipeTextView.textColor == self.grayColor {
            self.recipeTextView.text = nil
            self.recipeTextView.textColor = UIColor.black
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
