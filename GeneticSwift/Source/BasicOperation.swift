//
//  GroupOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation


typealias OperationClosure = ( () -> () )

class BasicOperation : Operation {
    fileprivate var _finished = false
    fileprivate var _executing = false
    
    fileprivate var closure: OperationClosure
    
    init(closure: @escaping OperationClosure) {
        self.closure = closure
    }
    
    override public var isExecuting: Bool {
        get { return _executing }
        set {
            willChangeValue(forKey: "isExecuting")
            _executing = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override public var isFinished: Bool {
        get { return _finished }
        set {
            willChangeValue(forKey: "isFinished")
            _finished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    public func add(subOperation: Operation) {
        addDependency(subOperation)
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        _executing = true
        
        closure()
    }
}
