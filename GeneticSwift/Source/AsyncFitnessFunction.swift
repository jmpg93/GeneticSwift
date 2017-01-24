//
//  AsyncFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

//TODO: Check
open class AsyncFitnessFunction: GeneticAsyncFitnessFunction {
    
    open let queue: OperationQueue
    let evaluationClosure: EvaluationClosure
    
    public init(_ evaluationClosure: @escaping EvaluationClosure) {
        self.evaluationClosure = evaluationClosure
        queue = OperationQueue()
        queue.isSuspended = true
        queue.maxConcurrentOperationCount = 1
    }
    
    public func evaluate(chromosome: GeneticChromosome) -> Double {
        return evaluationClosure(chromosome)
    }
    
    public func pause() {
        queue.isSuspended = true
    }
    
    public func resume() {
        queue.isSuspended = false
    }
    
    public func evaluate(chromosome: GeneticChromosome, fitnessClosure: @escaping (Double) -> ()) {
        queue.addOperation {
            // Get fitness
            let fitness = self.evaluate(chromosome: chromosome)
            
            fitnessClosure(fitness)
        }
    }
}

public typealias Closure = () -> ()

public class FitnessOperation : Operation {
    
    private var _finished = false // Our read-write mirror of the super's read-only finished property
    var _executing = false // Our read-write mirror of the super's read-only executing property
    
    var _numberOfOperationsFinished = 0 // The number of finished operations
    
    let closure: Closure
    
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
    
    
    
    init (closure: @escaping Closure) {
        self.closure = closure
        super.init()
    }
    
    func checkCompletion() {
        _numberOfOperationsFinished += 1
        
        if true {
            self.isExecuting = false
            self.isFinished = true
        }
        
    }
    
    override public func start()  {
        if isCancelled {
            isFinished = true
            return
        }
        
        isExecuting = true
        
        _numberOfOperationsFinished = 0
        let operation = BlockOperation()
        
        let actions: [Int] = []
        for _ in actions {
            
            operation.addExecutionBlock {
                self.closure()
            }
        }
        
        OperationQueue.main.addOperation(operation)
        
    }
}
