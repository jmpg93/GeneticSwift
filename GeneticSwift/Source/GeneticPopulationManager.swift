//
//  GeneticPopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulation {
    
    var ancestor: GeneticChromosome { get }
    var best: GeneticChromosome { get }
    
    var size: Int { get }
    var chromosomes: [GeneticChromosome] { get }

    var fitnessFunction: GeneticFitnessFunction { get }
    var selectionMethod: GeneticSelectionMethod { get }
    
    var crossoverRate: Double { get }
    var mutationRate: Double { get }
    var selectionRage: Double { get }
    
    mutating func crossover()
    mutating func mutate()
    mutating func select()
    
    mutating func evaluate()
}



public extension GeneticPopulation {
    public var crossoverRate: Double {
        return 0.8
    }
    
    public var mutationRate: Double {
        return 0.3
    }
    
    public var selectionRage: Double {
        return 0
    }
}
