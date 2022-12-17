//
//  Lesson4.swift
//  GCD
//
//  Created by Андрей Паутов on 16.12.2022.
//

import Foundation
import UIKit

class DispatchSemaphore1 {
    
    private let queue = DispatchQueue(label: "Label", attributes: .concurrent)
    
    func doWork() {
        let semaphore = DispatchSemaphore(value: 0)
        queue.async {
            semaphore.wait() // -1
            sleep(3)
            print("Method 1")
            semaphore.signal() // +1
        }

        queue.async {
            semaphore.wait() // -1
            sleep(3)
            print("Method 2")
            semaphore.signal() // +1
        }

        queue.async {
            semaphore.wait() // -1
            sleep(3)
            print("Method 3")
            semaphore.signal() // +1
        }
    }
    
    func doWork1() {
        let sem = DispatchSemaphore(value: 0)
        
        DispatchQueue.concurrentPerform(iterations: 10) { (id: Int) in
            sem.wait()
            sleep(1)
            print("Block", String(id))
            sem.signal()
        }
    }
}

class SemaphoreTest {
    private let classSemaphore = DispatchSemaphore(value: 1)
    private var array = [Int]()
    
    private func methodWork(_ id: Int) {
        classSemaphore.wait()
        
        array.append(id)
        print("test array", array.count)
        
        Thread.sleep(forTimeInterval: 1)
        classSemaphore.signal()
    }
    
    func startAllThreads() {
        DispatchQueue.global().async {
            self.methodWork(111)
        }
        
        DispatchQueue.global().async {
            self.methodWork(231)
        }
        
        DispatchQueue.global().async {
            self.methodWork(1211)
        }
        
        DispatchQueue.global().async {
            self.methodWork(541)
        }
    }
}
