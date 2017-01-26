//
//  AproximationFitnessFunctionswift.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias AproximationFunctionBlock = (_ x: Double) -> (Double)

open class AproximationFitnessFunction<T> : GeneticAproximationFitnessFunction where T : Pointable2D {
    open let aproximationFunction: AproximationFunctionBlock
    
    public init(aproximationFunction: @escaping AproximationFunctionBlock) {
        self.aproximationFunction = aproximationFunction
    }

    open func evaluate(chromosome: Chromosome<T>) -> Double {
        var error: Double = 0
        
        for value in chromosome.values {
            
            let itShouldBe = aproximationFunction(value.x)
            let itIs = value.y
            
            let delta = itShouldBe - itIs
            
            error += Double(abs(delta))
        }
        
        return 100 / (error - 1)
    }
    
    open func evaluate(chromosome: GeneticChromosome) -> Double {
        guard let c = chromosome as? Chromosome<T> else {
            fatalError("This can't be possible.")
        }
        
        return evaluate(chromosome: c)
    }
}
