//
//  MySixthViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 18.12.2022.
//

import UIKit

class MySixthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson 6"
        view.backgroundColor = .white
        //doLesson6RaceCondition()
        doLesson6SafeArray()
    }
    
    func doLesson6RaceCondition() {
        let raceCondition = RaceCondition()
        raceCondition.conPerform()
        print(raceCondition.array)
        print(raceCondition.array.count)
    }
    
    func doLesson6SafeArray() {
        let arraySafe = SafeArray<Int>()
        DispatchQueue.concurrentPerform(iterations: 10) { (index) in
            arraySafe.append(index)
        }
        print("arraySafe", arraySafe.valueArray)
        print("arraySafeCount", arraySafe.valueArray.count)
    }
}
