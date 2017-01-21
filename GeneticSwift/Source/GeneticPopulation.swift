//
//  GeneticPopulation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulation {
    var ancestor: GeneticChromosome { get }
    var best: GeneticChromosome { get  set }
    
    var chromosomes: [GeneticChromosome] { get set }
    
    func crossover() -> GeneticPopulation
    func mutate() -> GeneticPopulation
    
    func copy() -> GeneticPopulation
}

public extension GeneticPopulation {
    func crossover() -> GeneticPopulation {
        //TODO: Crossover
        var mutatedPopulation = self.copy()
        mutatedPopulation.chromosomes = chromosomes.map({ $0.mutate() })
        return mutatedPopulation
    }
    
    func mutate() -> GeneticPopulation {
        var mutatedPopulation = self.copy()
        mutatedPopulation.chromosomes = chromosomes.map({ $0.mutate() })
        return mutatedPopulation
    }
}

