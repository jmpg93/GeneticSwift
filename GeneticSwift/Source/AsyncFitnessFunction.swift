//
//  AsyncFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class AsyncFitnessFunction: GeneticFitnessFunction {
    var isAsync: Bool = true
    
    func addOperation(_ operation: () -> ()) {
        
    }
    public func evaluate(chromosome: GeneticChromosome) -> Double {
        return 0
    }

    open let queue: OperationQueue
    
    init() {
        queue = OperationQueue()
    }
}

open class FitnessOperation : Operation {
    
}
