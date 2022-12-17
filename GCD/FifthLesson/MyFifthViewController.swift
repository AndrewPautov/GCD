//
//  MyFifthViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 17.12.2022.
//

import UIKit

class MyFifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson5"
        view.backgroundColor = .white
        createTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        asyncGroup()
    }
    
    func asyncGroup() {
        let viewImage = EightImage(frame: CGRect(x: 0, y: 0, width: 700, height: 900))
        viewImage.backgroundColor = .red
        let aGroup = DispatchGroup()
        
        for i in 0...3 {
            aGroup.enter()
            viewImage.asyncLoadImage(imageURL: URL(string: viewImage.imageURLs[i])!, runQueue: .global(), completionQueue: .main) { result, error in
                guard let image1 = result else { return }
                viewImage.images.append(image1)
                aGroup.leave()
            }
        }
        aGroup.notify(queue: .main) {
            for i in 0...3 {
                viewImage.ivs[i].image = viewImage.images[i]
            }
        }
        view.addSubview(viewImage)
    }
    
    func createTabBar() {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        self.tabBarItem = tabBarItem
    }
    
}
