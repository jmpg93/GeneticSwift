//
//  GeneticChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticChromosome : class {
    var fitness: Double { get set }
    
    func evaluate(with fitnessFunction: GeneticFitnessFunction)
    //TODO: Check
    func evaluate(with fitnessFunction: GeneticAsyncFitnessFunction)
    
    func crossover(with chromosome: GeneticChromosome) -> (c1: GeneticChromosome, c2: GeneticChromosome)
    func mutate() -> GeneticChromosome
    func new() -> GeneticChromosome
}

public extension GeneticChromosome {
    //TODO: Check
    public func evaluate(with fitnessFunction: GeneticFitnessFunction) {
        if let fitnessFunction = fitnessFunction as? GeneticAsyncFitnessFunction {
            evaluate(with: fitnessFunction)
        } else {
            self.fitness = fitnessFunction.evaluate(chromosome: self)
        }
    }
    
    public func evaluate(with fitnessFunction: GeneticAsyncFitnessFunction) {
        fitnessFunction.evaluate(chromosome: self) { fitness in
            self.fitness = fitness
        }
    }
}
