//
//  PopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class Population : GeneticPopulation {

    //TODO: Data soutce?
    public let size: Int
    public let fitnessFunction: GeneticFitnessFunction
    public let selectionMethod: GeneticSelectionMethod
    
    public var delegate: GeneticPopulationDelegate? = nil
    
    public private(set) var ancestor: GeneticChromosome
    public private(set) var best: GeneticChromosome
    public private(set) var maxFitness: Double?
    
    public private(set) var phase: EvolutionPhase
    public private(set) var generation: Int
    
    public private(set) var chromosomes: [GeneticChromosome]
    
    public init(ancestor: GeneticChromosome, size: Int, fitnessFunction: GeneticFitnessFunction, selectionMethod: GeneticSelectionMethod) {
        self.size = size
        self.fitnessFunction = fitnessFunction
        self.selectionMethod = selectionMethod
        
        self.ancestor = ancestor
        self.best = ancestor
        self.maxFitness = nil
        
        generation = 0
        phase = .none
        
        self.chromosomes = []
    }
    
    public func stop() {
        
    }
    
    public func pause() {

    }
    
    public func next() {
        randomize()
        mutate()
        crossover()
        evaluate()
        
    }
    
    public func mutate() {
        phase = .mutation
        
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= crossoverRate {
                chromosomes += [chromosome.mutate()]
            }
        }
    }
    
    public func crossover() {
        phase = .crossover
        
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= mutationRate && index >= 1 {
                let c1 = chromosome.crossover(with: chromosomes[index-1])
                let c2 = chromosomes[index-1].crossover(with: chromosome)
                
                chromosomes += [c1, c2]
            }
        }
    }
    
    public func select() {
        phase = .selection
        
        let outcome = selectionMethod.select(population: self)
        chromosomes = outcome.selected
    }
    
    public func evaluate() {
        phase = .evaluation
        
        chromosomes.forEach { chromosome in
            let chromosomeFitness = 0.0//fitnessFunction.evaluate(chromosome: chromosome)
            if chromosomeFitness > maxFitness! {
            }
        }
    }
    
    public func randomize() {
        phase = .randomize
        
        let emptySlots = size - chromosomes.count
        
        for index in 0...emptySlots where index > 0 {
            chromosomes.append(ancestor.new())
        }
    }
    
    var random: Double {
        return drand48()
    }
    
}
