//
//  MySecondViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 10.12.2022.
//

import UIKit

class MySecondViewController: UIViewController {

    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lesson 2"
        view.backgroundColor = .white
        
        createTabBar()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        afterBlock(seconds: 2, queue: .main) {
            self.showAlert()
        }
    }
// MARK: Пример возможностей потоков 1
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "Hello", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(), completion: @escaping() -> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
    
// MARK: Пример возможностей потоков 2
    func myInactiveQueue() {
        let inactiveQueue = DispatchQueue(label: "Swift", attributes: [.concurrent, .initiallyInactive])
        // Дополнительный параметр в атрибуте позволяет активировать и деактивировать поток.
        // До вызова функции .activate поток не запустится.
        
        inactiveQueue.async {
             print("Done!")
        }
        print("not started yet...")
        inactiveQueue.activate() // активатор потока
        print("Already started")
        inactiveQueue.suspend() // остановка потока
        print("fall asleep")
        inactiveQueue.resume() // восстановление активации потока
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
    
    @objc func buttonPressed() {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func createTabBar() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        self.tabBarItem = tabBarItem
    }
}
