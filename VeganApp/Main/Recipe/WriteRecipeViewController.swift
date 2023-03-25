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
    let grayColor: UIColor = UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1.0)
    weak var delegate: WriteRecipeViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.registerButton.isEnabled = false
    }
    
    
    @IBAction func tapConfirmButton(_ sender: UIButton) {
        guard let title = self.titleTextField.text else { return }
        guard let ingredients = self.ingredientsTextField.text else { return }
        guard let veganLevel = self.veganLevelTextField.text else { return }
        
        guard let hashtag = self.hastagTextField.text else { return }
        let recipe = Recipe(title: title, ingredients: [], veganLevel: veganLevel, steps: [], recipeImageUrl: "", hashtag: hashtag)
        self.delegate?.didSelectRegister(recipe: recipe)
        self.navigationController?.popViewController(animated: true)
    }
}
