//
//  Chromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct Chromosome : GeneticChromosome {
    
    public var fitness: Double?

    public func fitness(with fitnessFunction: GeneticFitnessFunction) -> Double {
        return fitnessFunction.evaluate(chromosome: self)
    }

    mutating public func evaluate(finessFunction: GeneticFitnessFunction) {
        fitness = 10
    }
    
    public func crossover(with chromosome: GeneticChromosome) -> GeneticChromosome {
        return self
    }
    
    public func mutate() -> GeneticChromosome {
        return self
    }
    
    public func new() -> GeneticChromosome {
        return self
    }
}
