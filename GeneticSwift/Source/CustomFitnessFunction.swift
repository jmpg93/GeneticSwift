//
//  BaseFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
public typealias EvaluationClosure = (_ chromosome: GeneticChromosome) -> Double

public struct CustomFitnessFunction: GeneticFitnessFunction {
    let evaluateClosure: EvaluationClosure
    public init(_ evaluateClosure: @escaping EvaluationClosure) {
        self.evaluateClosure = evaluateClosure
    }
    
    public func evaluate(chromosome: GeneticChromosome) -> Double {        
        return DispatchQueue.safelySync(execute: { evaluateClosure(chromosome) })
    }
}
