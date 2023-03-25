//
//  RecipeDetailViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var veganLevelLabel: UILabel!
    @IBOutlet weak var hashtagLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var ingredientTextView: UITextView!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var veganButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.navigationController?.navigationBar.tintColor = .black
        let userDefaults = UserDefaults.standard
        userDefaults.set(2, forKey: "level")
     }
    var recipe: Recipe?
    private func configureView() {
        guard let recipe = self.recipe else { return }
        self.titleLabel.text = recipe.title
        self.veganLevelLabel.text = recipe.veganLevel
        self.hashtagLabel.text = recipe.hashtag
        self.ingredientTextView.text = recipe.ingredients
        self.contentsTextView.text = recipe.steps
        self.foodImageView.image = UIImage(named: recipe.title)
        self.foodImageView.layer.cornerRadius = 14
        self.veganButton.layer.cornerRadius = 25
        self.ingredientTextView.layer.cornerRadius = 18
        self.contentsTextView.layer.cornerRadius = 18
        self.ingredientTextView.backgroundColor = UIColor(red: 237/256, green: 235/256, blue: 235/256, alpha: 1.0)
        self.contentsTextView.backgroundColor = UIColor(red: 237/256, green: 235/256, blue: 235/256, alpha: 1.0)
        
    }
}
