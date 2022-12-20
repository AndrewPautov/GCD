//
//  MySeventhViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 19.12.2022.
//

import UIKit

class MySeventhViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lesson 7"
        view.backgroundColor = .white
        doLessonSeven()
    }
    
    func doLessonSeven() {
        let lesson = Lesson()
        lesson.doLessonSeven()
    }
}
