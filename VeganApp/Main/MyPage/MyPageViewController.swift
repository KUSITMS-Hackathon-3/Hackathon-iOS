//
//  MyPageViewController.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/26.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var threeView: UIView!
    @IBOutlet weak var nView: UIView!
    @IBOutlet weak var sView: UIView!
    @IBOutlet weak var oView: UIView!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var lView: UIView!
    
    var borderColor: UIColor = UIColor(red: 230/256, green: 230/256, blue: 230/256, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    func configureView() {
        self.oneView.layer.cornerRadius = 12
        self.twoView.layer.cornerRadius = 12
        self.threeView.layer.cornerRadius = 12
        self.nView.layer.addBorder([UIRectEdge.bottom], color: borderColor, width: 1.0)
        self.sView.layer.addBorder([UIRectEdge.bottom], color: borderColor, width: 1.0)
        self.oView.layer.addBorder([UIRectEdge.bottom], color: borderColor, width: 1.0)
        self.aView.layer.addBorder([UIRectEdge.bottom], color: borderColor, width: 1.0)
        self.lView.layer.addBorder([UIRectEdge.bottom], color: borderColor, width: 1.0)
    }

}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
