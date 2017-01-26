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
    public typealias ChomosomeValue = T
    open let aproximationFunction: AproximationFunctionBlock
    
    public init(aproximationFunction: @escaping AproximationFunctionBlock) {
        self.aproximationFunction = aproximationFunction
    }
    
    //TODO: Improve aproximation algorithm
    open func evaluate(chromosome: Chromosome<ChomosomeValue>) -> Double {
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
        guard let c = chromosome as? Chromosome<ChomosomeValue> else {
            fatalError("The type is not setted")
        }
        
        return evaluate(chromosome: c)
    }
}
