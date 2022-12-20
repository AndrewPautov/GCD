//
//  MyViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 10.12.2022.
//

import UIKit

class MyViewController: UIViewController {
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "VC 1"
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }
    
    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        view.addSubview(button)
    }
    
    @objc func pressAction() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
