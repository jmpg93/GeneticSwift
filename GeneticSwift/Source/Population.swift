//
//  PopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class Population : GeneticPopulation, GeneticPopulationDelegate {

    public let size: Int
    public let fitnessFunction: GeneticFitnessFunction
    public let selectionMethod: GeneticSelectionMethod
    
    public weak var delegate: GeneticPopulationDelegate? = nil
    public weak var dataSource: GeneticPopulationDataSource? = nil
    
    public private(set) var ancestor: GeneticChromosome
    public private(set) var best: GeneticChromosome
    
    public private(set) var phase: EvolutionPhase
    public private(set) var generation: Int
    
    public private(set) var chromosomes: [GeneticChromosome]
    
    public init(ancestor: GeneticChromosome, size: Int, fitnessFunction: GeneticFitnessFunction, selectionMethod: GeneticSelectionMethod) {
        self.size = size
        self.fitnessFunction = fitnessFunction
        self.selectionMethod = selectionMethod
        
        ancestor.evaluate(with: fitnessFunction)
        
        self.ancestor = ancestor
        self.best = ancestor

        self.generation = 0
        self.phase = .none
        
        self.chromosomes = []
    }
    
    public func start() {
        start(phase: .randomize)
    }
    
    public func randomize() {
        
        let emptySlots = size - chromosomes.count
        
        for index in 0...emptySlots where index > 0 {
            let random = ancestor.new()
            random.evaluate(with: fitnessFunction)
            
            chromosomes += [random]
        }
        
        startNextPhase()
    }
    
    public func mutate() {
        
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= crossoverRate {
                let mutatedChromosome = chromosome.mutate()
                mutatedChromosome.evaluate(with: fitnessFunction)
                
                chromosomes += [mutatedChromosome]
            }
        }
        
        startNextPhase()
    }
    
    public func crossover() {
        
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= mutationRate && index >= 1 {
                let (c1, c2) = chromosome.crossover(with: chromosomes[index-1])
                
                c1.evaluate(with: fitnessFunction)
                c2.evaluate(with: fitnessFunction)
                
                chromosomes += [c1, c2]
            }
        }
        
        startNextPhase()
    }
    
    public func select() {
        let outcome = selectionMethod.select(population: self)
        chromosomes = outcome.selected
        
        startNextPhase()
    }
    
    public func evaluate() {
        for chromosome in chromosomes {
            if chromosome.fitness > best.fitness {
                best = chromosome
            }
        }
        
        startNextPhase()
    }
    
    public func end() {
        if let delegate = delegate, !delegate.populationShouldStartNextGeneration(population: self) {
            return
        } else if !populationShouldStartNextGeneration(population: self) {
            return
        }
        
        generation += 1
        start(phase: .randomize)
    }
    
    private func startNextPhase() {
        delegate?.populationDidEndPhase(phase: phase, population: self)
        start(phase: phase.next)
    }
    
    private func start(phase: EvolutionPhase) {
        self.phase = phase
        
        switch phase {
        case .randomize:
            randomize()
        case .crossover:
            crossover()
        case .mutation:
            mutate()
        case .evaluation:
            evaluate()
        case .selection:
            select()
        case .end:
            end()
        case .none:
            break
        }
    }
    
    var random: Double {
        return drand48()
    }
}
