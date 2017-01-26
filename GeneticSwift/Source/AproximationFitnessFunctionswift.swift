//
//  AproximationFitnessFunctionswift.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias AproximationFunctionBlock = (_ x: Double) -> (Double)

open class AproximationFitnessFunction<T> : GeneticAproximationFitnessFunction where T : Aproximatable2D {
    open let aproximationFunction: AproximationFunctionBlock
    
    public init(aproximationFunction: @escaping AproximationFunctionBlock) {
        self.aproximationFunction = aproximationFunction
    }
    
    //TODO: Improve aproximation algorithm
    open func evaluate(chromosome: Chromosome<T>) -> Double {
        var fitness: Double = 5000
        
        for value in chromosome.values {
            if value.x < 1 || value.y < 1 {
                fitness -= 1000
                continue
            }
            
            let itShouldBe = aproximationFunction(value.x)
            let itIs = value.y
            
            let delta = itShouldBe - itIs
            
            fitness -= Double(abs(delta))
        }
        
        return fitness
    }
    
    open func evaluate(chromosome: GeneticChromosome) -> Double {
        guard let c = chromosome as? Chromosome<T> else {
            fatalError("This can't be possible.")
        }
        
        return evaluate(chromosome: c)
    }
}
