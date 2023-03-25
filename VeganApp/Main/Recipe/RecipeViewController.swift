//
//  RecipeViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var recipeList = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRecipeCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let writeRecipeViewController = segue.destination as? WriteRecipeViewController {
            writeRecipeViewController.delegate = self
        }
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else { return UICollectionViewCell() }
        let recipe = self.recipeList[indexPath.row]
        cell.recipeTitle.text = recipe.title
        return cell
    }
}

extension RecipeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(UIScreen.main.bounds.width / 2) - 20, height: 200)
    }
}


extension RecipeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") as? RecipeDetailViewController else { return }
        let recipe = self.recipeList[indexPath.row]
        recipeDetailViewController.recipe = recipe
//        recipeDetailViewController.title = recipe.title
//        recipeDetailViewController.veganLevel = recipe.veganLevel
//        recipeDetailViewController.hashtag = recipe.hashtag
        
        
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }
}


extension RecipeViewController: WriteRecipeViewDelegate {
    func didSelectRegister(recipe: Recipe) {
        self.recipeList.append(recipe)
        print(recipeList)
        self.recipeCollectionView.reloadData()
    }
}
