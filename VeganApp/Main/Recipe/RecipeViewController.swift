//
//  RecipeViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    private var recipeList = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    private func configureRecipeCollectionView() {
        self.recipeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.recipeCollectionView.delegate = self
        self.recipeCollectionView.dataSource = self
    }
    
}


extension RecipeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else { return UICollectionViewCell() }
        let recipe = self.recipeList[indexPath.row]
        cell.recipeTitle.text = recipe.title
//        cell.recipeImageView = recipe.recipImageUrl
        return cell
    }
}

extension RecipeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        return CGSize(width: width, height: 50)
    }
}


extension RecipeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") as? RecipeDetailViewController else { return }
        let recipe = self.recipeList[indexPath.row]
//        recipeDetailViewController.
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
        
    }
}

