//
//  GeneticPopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulation : CustomStringConvertible {
    
    var ancestor: GeneticChromosome { get }
    var best: GeneticChromosome { get }
    var generation: Int { get }
    var phase: EvolutionPhase { get }
    
    var chromosomes: [GeneticChromosome] { get }
    
    //TODO: Decide.
    var size: Int { get }
    var fitnessFunction: GeneticFitnessFunction { get }
    var selectionMethod: GeneticSelectionMethod { get }
    
    var delegate: GeneticPopulationDelegate? { get set }
    var dataSource: GeneticPopulationDataSource? { get set }
    
    var crossoverRate: Double { get }
    var mutationRate: Double { get }
    var selectionRage: Double { get }
    
    mutating func crossover()
    mutating func mutate()
    mutating func select()
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
    
    public var description: String {
        return "Population with \(chromosomes.count) chromosomes in the \(phase) phase on generation \(generation). Current max fitness: \(best.fitness)"
    }
}
