//
//  VC2.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit

class VC2: UIViewController {
    lazy var imageV: UIImageView = {
        let tempV = UIImageView(frame: CGRect(x: 0, y: UI.navigationBarMaxY, width: self.view.frame.width, height: UI.screenHeigth - UI.navigationBarMaxY - UI.tabBarHeight))
        tempV.layer.borderWidth = 1.0
        tempV.layer.borderColor = UIColor.blue.cgColor
        tempV.backgroundColor = UIColor.red
        tempV.image = UIImage(named: "pageTwo_image")
        tempV.contentMode = .scaleToFill
        return tempV
    }()
    
    lazy var btn: UIButton = {
        let buttonSize = CGSize(width: 85, height: 50)
        let tempBtn = UIButton(frame: CGRect(origin: CGPoint(x: UI.screenWidth - 20 - buttonSize.width, y: UI.screenHeigth - UI.tabBarHeight - 20 - buttonSize.height), size: buttonSize))
        tempBtn.layer.cornerRadius = buttonSize.height/2
        tempBtn.clipsToBounds = true
        tempBtn.backgroundColor = UIColor.brown
        tempBtn.setTitle("Detail", for: .normal)
        tempBtn.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return tempBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "second"
        view.addSubview(imageV)
        view.addSubview(btn)
    }
    
    @objc func buttonAction(sender: UIButton) {
        self.navigationController?.pushViewController(DetailVC(), animated: true)
    }
}
