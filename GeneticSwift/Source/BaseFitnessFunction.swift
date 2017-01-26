//
//  BaseFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
public typealias EvaluationClosure = (_ chromosome: GeneticChromosome) -> Double

public struct BaseFitnessFunction: GeneticFitnessFunction {
    let evaluateClosure: EvaluationClosure
    public init(_ evaluateClosure: @escaping EvaluationClosure) {
        self.evaluateClosure = evaluateClosure
    }
    
    public func evaluate(chromosome: GeneticChromosome) -> Double {
        if Thread.isMainThread {
            return evaluateClosure(chromosome)
        } else {
            return DispatchQueue.main.sync(execute: { evaluateClosure(chromosome) })
        }
    }
}
