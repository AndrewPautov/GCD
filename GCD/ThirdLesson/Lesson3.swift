//
//  Lesson3.swift
//  GCD
//
//  Created by Андрей Паутов on 16.12.2022.
//

import Foundation
import UIKit

class DispatchWorkItem1 {
    let queue = DispatchQueue(label: "DispatchWorkItem1", attributes: .concurrent)
    
    public func create() {
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start task")
        }
        
        workItem.notify(queue: .main) {
            print(Thread.current)
            print("Task is finished")
        }
        
        queue.async(execute: workItem)
    }
}


class DispatchWorkItem2 {
    let queue = DispatchQueue(label: "DispatchWorkItem2")
    
    public func create() {
        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task 1")
        }
        
        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task 2")
        }
        
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start work item task")
        }
        
        queue.async(execute: workItem)
        
        workItem.cancel()
    }
}
