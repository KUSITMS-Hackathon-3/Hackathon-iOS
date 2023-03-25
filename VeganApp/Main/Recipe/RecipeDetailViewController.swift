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
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var contentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
     }
    var recipe: Recipe?
    private func configureView() {
        guard let recipe = self.recipe else { return }
        self.titleLabel.text = recipe.title
        self.veganLevelLabel.text = recipe.veganLevel
        self.hashtagLabel.text = recipe.hashtag
    }
}
