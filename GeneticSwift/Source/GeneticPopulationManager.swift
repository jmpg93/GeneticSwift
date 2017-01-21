//
//  GeneticPopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulationManager {
    
    var size: Int { get }
    var fitnessFunction: GeneticFitnessFunction { get }
    var selectionMethod: GeneticSelectionMethod { get }
    
    var crossoverRate: Double { get }
    var mutationRate: Double { get }
    var selectionRage: Double { get }
    
    func createPopulation(for ancestor: GeneticChromosome) -> GeneticPopulation
    
    func crossover(population: GeneticPopulation) -> GeneticPopulation
    func mutate(population: GeneticPopulation) -> GeneticPopulation
    func select(population: GeneticPopulation) -> GeneticPopulation
    
    func regenerate(population: GeneticPopulation) -> GeneticPopulation
    func resize(population: GeneticPopulation, to: Int) -> GeneticPopulation
    
    func evaluate(population: GeneticPopulation)
}

public extension GeneticPopulationManager {
    public var crossoverRate: Double {
        return 0.8
    }
    
    public var mutationRate: Double {
        return 0.3
    }
    
    public var selectionRage: Double {
        return 0
    }
    
    //TODO: Create pop
    func createPopulation(for ancestor: GeneticChromosome) -> GeneticPopulation {
        fatalError()
    }
    
    //TODO: Mutate pop
    func mutate(population: GeneticPopulation) -> GeneticPopulation {
        fatalError()
    }
    
    func crossover(population: GeneticPopulation) -> GeneticPopulation {
        fatalError()
    }
    
    func select(population: GeneticPopulation) -> GeneticPopulation {
        fatalError()
    }
    
    func regenerate(population: GeneticPopulation) -> GeneticPopulation {
        fatalError()
    }
    
    func resize(population: GeneticPopulation, to: Int) -> GeneticPopulation {
        fatalError()
    }
    
    func evaluate(population: GeneticPopulation) {
        fatalError()
    }
}
