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
    var evaluated: Bool { get set }
    
    func evaluate(with fitnessFunction: GeneticFitnessFunction)
    
    func crossover(with chromosome: GeneticChromosome) -> (c1: GeneticChromosome, c2: GeneticChromosome)
    func mutate() -> GeneticChromosome
    func new() -> GeneticChromosome
}

public extension GeneticChromosome {
    public func evaluate(with fitnessFunction: GeneticFitnessFunction) {
        self.fitness = fitnessFunction.evaluate(chromosome: self)
        self.evaluated = true
    }
}
