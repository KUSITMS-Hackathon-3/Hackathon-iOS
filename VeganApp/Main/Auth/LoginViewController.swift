//
//  LoginViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: LoginView())
    }
}
