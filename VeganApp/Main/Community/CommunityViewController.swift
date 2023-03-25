//
//  CommunityViewController.swift
//  VeganApp
//
//  Created by 이안진 on 2023/03/26.
//

import UIKit
import SwiftUI

class CommunityViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBSegueAction func add(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CommunityView())
    }
    
}
