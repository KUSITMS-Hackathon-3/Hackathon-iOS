//
//  RecipeViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewView: UIView!
    @IBOutlet weak var iView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeList = [Recipe](){
        didSet {
            self.saveRecipeList()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRecipeCollectionView()
        self.loadGoodHabitList()
        self.configureView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let writeRecipeViewController = segue.destination as? WriteRecipeViewController {
            writeRecipeViewController.delegate = self
        }
    }
    
    func configureView() {
        self.iView.layer.cornerRadius = 12
        self.imageView.layer.cornerRadius = 18
        self.collectionViewView.layer.cornerRadius = 18
    }
    
    private func configureRecipeCollectionView() {
        self.recipeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.recipeCollectionView.delegate = self
        self.recipeCollectionView.dataSource = self
    }
    
    
    private func saveRecipeList() {
        let data = self.recipeList.map {
            
            [
                "title": $0.title,
                "steps": $0.steps,
                "ingredients": $0.ingredients,
                "veganLevel": $0.veganLevel,
                "recipeImageUrl": $0.recipeImageUrl?.jpegData(compressionQuality:1),
                "hashtag": $0.hashtag,
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "recipeList")
    }
    
    
    private func loadGoodHabitList() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "recipeList") as? [[String: Any]] else { return }
        self.recipeList = data.compactMap {
            guard let title =  $0["title"] as? String else { return nil }
            guard let steps = $0["steps"] as? String else { return nil }
            guard let ingredients = $0["ingredients"] as? String else { return nil }
            guard let veganLevel = $0["veganLevel"] as? String else { return nil }
            let recipeImageUrlData = $0["recipeImageUrl"] as? Data ?? Data()
            let recipeImageUrl = UIImage(data: recipeImageUrlData) ?? UIImage()
            guard let hashtag = $0["hashtag"] as? String else { return nil }
            return Recipe(title: title, ingredients: ingredients, veganLevel: veganLevel, steps: steps, recipeImageUrl: recipeImageUrl, hashtag: hashtag)
        }
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
        cell.hashtagLabel.text = recipe.hashtag
        cell.veganLevelLabel.setTitle(recipe.veganLevel, for: .normal)
        return cell
    }
}

extension RecipeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIScreen.main.bounds.width - 84, height: 110)
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
