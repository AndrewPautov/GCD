//
//  Lesson6.swift
//  GCD
//
//  Created by Андрей Паутов on 18.12.2022.
//

import Foundation

class RaceCondition {
    var array = [Int]()
    
    func conPerform() {
        DispatchQueue.concurrentPerform(iterations: 10) { (index) in
            array.append(index)
        }
    }
}

class SafeArray<T> {
    private var array = [T]()
    
    private let queue = DispatchQueue(label: "Label", attributes: .concurrent)
    
    public func append(_ value: T) {
        queue.async(flags: .barrier) {
            self.array.append(value)
        }
    }
    
    public var valueArray: [T] {
        var result = [T]()
        queue.sync {
            result = self.array
        }
        return result
    }
}

