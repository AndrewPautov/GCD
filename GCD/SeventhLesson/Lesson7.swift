//
//  Lesson7.swift
//  GCD
//
//  Created by Андрей Паутов on 18.12.2022.
//

import Foundation

class Lesson: Thread {
    
    func doLessonSeven() {
        var result: String?
        let concatOperation = BlockOperation {
            result = "Hello" + " " + "World"
            print(Thread.current)
        }

//        concatOperation.start() // main thread
//        print(result!)

        let queue1 = OperationQueue()
        queue1.addOperation(concatOperation) // null thread
        print(result)
    }
    
}
