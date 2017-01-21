//
//  GeneticChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticChromosome {
    var fitness: Double { get set }
    mutating func evaluate(finessFunction: GeneticFitnessFunction)
    
    func crossover(with chromosome: GeneticChromosome) -> GeneticChromosome
    func mutate() -> GeneticChromosome
    func new() -> GeneticChromosome
}
