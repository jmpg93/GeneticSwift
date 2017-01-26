//
//  Optimization.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct OptimizationFitnessFunction : GeneticSelectionMethod, CustomStringConvertible {
    public func evaluate(chromosome: GeneticChromosome) -> Double {
        fatalError()
        if Thread.isMainThread {
            return evaluateClosure(chromosome)
        } else {
            return DispatchQueue.main.sync(execute: { evaluateClosure(chromosome) })
        }
    }
    
}
