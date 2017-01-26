//
//  Optimization.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol OptimizationFitnessFunction : GeneticFitnessFunction {
    func optimizationFunction(x: Double) -> Double
}

public class TestOptimizationFitnessFunction : OptimizationFitnessFunction {
    public func optimizationFunction(x: Double) -> Double {
        return 0
    }
    
    public func evaluate(chromosome: GeneticChromosome) -> Double {

        let idShouldBe = optimizationFunction(x: 0)
        let itIs = 0
        
        return 0
    }
    
}
