//
//  RegressionFitness.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class DoubleRegressionFitnessFunction<T> : GeneticFitnessFunction where T : Pointable2D {
    open let values: [T]
    
    public init(values: [T]) {
        self.values = values
    }

    open func evaluate(chromosome: Chromosome<Double>) -> Double {
        var error: Double = 0
        
        for value in values {
            let itShouldBe = polynomialFunction(for: chromosome.values, x: value.x)
            let itIs = value.y
            
            let delta = itShouldBe - itIs
            
            error += Double(abs(delta))
        }

        return 100 / (error - 1)
    }
    
    open func evaluate(chromosome: GeneticChromosome) -> Double {
        guard let c = chromosome as? Chromosome<Double> else {
            fatalError("This can't be possible.")
        }
        return evaluate(chromosome: c)
    }
    
    open func polynomialFunction(for factors: [Double], x: Double) -> Double {
        var result: Double = 0
        
        for (index, factor) in factors.enumerated() {
            let n = Double(factors.count - index - 1)
            
            result += factor * pow(x, n)
        }
        
        return result
    }
    
    open func stringPolynomialFunction(for factors: [Double]) -> String {
        var function = "P(x) = "
        for (index, factor) in factors.enumerated() {
            let n = factors.count - index - 1
            let roundedFactor = String(format:"%.2f", factor)
            if n == 0 {
                function += "\(roundedFactor)"
            } else if n == 1 {
                function += "\(roundedFactor) * X + "
            } else {
                function += "\(roundedFactor) * X^\(n) + "
            }
        }
        
        return function
    }
}
