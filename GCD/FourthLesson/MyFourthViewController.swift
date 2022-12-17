//
//  MyFourthViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 16.12.2022.
//

import UIKit

class MyFourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson 4"
        view.backgroundColor = .white
        createTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //doLesson41()
        doLesson42()
    }
    
    func doLesson41() {
        let dispatchSemaphore1 = DispatchSemaphore1()
        dispatchSemaphore1.doWork()
        dispatchSemaphore1.doWork1()
        let semaphoreTest = SemaphoreTest()
        semaphoreTest.startAllThreads()
    }
    
    func doLesson42() {
        let semaphoreTest = SemaphoreTest()
        semaphoreTest.startAllThreads()
    }
    
    func createTabBar() {
        var tabBatItem = UITabBarItem()
        tabBatItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        self.tabBarItem = tabBatItem
    }
}
