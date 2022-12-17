//
//  ThirdViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 10.12.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson 2"
        view.backgroundColor = .white
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 20000) {
                print("\($0) times")
                print(Thread.current)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initLabel()
    }
    
    
    func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        label.center = view.center
        label.text = "HELLO"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)
    }
}
