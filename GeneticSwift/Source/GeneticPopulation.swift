//
//  GeneticPopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulation : class, CustomStringConvertible {
    
    var ancestor: GeneticChromosome { get }
    var best: GeneticChromosome { get }
    var generation: Int { get }
    var phase: EvolutionPhase { get }
    
    var chromosomes: [GeneticChromosome] { get }

    var size: Int { get }
    var fitnessFunction: GeneticFitnessFunction { get }
    var selectionMethod: GeneticSelectionMethod { get }
    
    var delegate: GeneticPopulationDelegate? { get set }
    
    var crossoverRate: Double { get }
    var mutationRate: Double { get }
    var selectionRage: Double { get }
    
    func crossover()
    func mutate()
    func select()
    
    func add(chromosome: GeneticChromosome)
    func rebase(chromosomes: [GeneticChromosome])
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
