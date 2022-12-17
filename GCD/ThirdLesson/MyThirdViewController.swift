//
//  MyThirdViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 16.12.2022.
//

import UIKit

class MyThirdViewController: UIViewController {

    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson 3"
        view.backgroundColor = .white
        createTabBar()
        doLesson3()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchImage()
    }
    
    func fetchImage() {
        guard let imageURL: URL = URL(string: "https://answit.com/wp-content/uploads/2017/01/full-hd.jpg") else { return }
        let queue = DispatchQueue.global(qos: .utility)
        var data: Data?
        let workItem = DispatchWorkItem(qos: .userInteractive) {
            data = try? Data(contentsOf: imageURL)
            //print(Thread.current)
        }
        
        queue.async(execute: workItem)
        workItem.notify(queue: .main) {
            if let imageData = data {
                self.imageView.image = UIImage(data: imageData)
            }
        }
        imageView.center = view.center
        view.addSubview(imageView)
    }
    
    func createTabBar() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        self.tabBarItem = tabBarItem
    }
    
    func doLesson3() {
        let dispatchWorkItem1 = DispatchWorkItem1()
        dispatchWorkItem1.create()
        
        let dispatchWorkItem2 = DispatchWorkItem2()
        dispatchWorkItem2.create()
    }
}
