//
//  PopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class Population : GeneticPopulation {

    public let size: Int
    public let fitnessFunction: GeneticFitnessFunction
    public let selectionMethod: GeneticSelectionMethod
    
    public private(set) var ancestor: GeneticChromosome
    public private(set) var best: GeneticChromosome
    public private(set) var maxFitness: Double
    
    public private(set) var chromosomes: [GeneticChromosome]
    
    public init(ancestor: GeneticChromosome, size: Int, fitnessFunction: GeneticFitnessFunction, selectionMethod: GeneticSelectionMethod) {
        self.size = size
        self.fitnessFunction = fitnessFunction
        self.selectionMethod = selectionMethod
        
        self.ancestor = ancestor
        self.best = ancestor
        
        self.chromosomes = []
        self.maxFitness = 0
        
        create()
    }
    
    public func nextGeneration() {
        mutate()
        crossover()
    }
    
    public func mutate() {
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= crossoverRate {
                chromosomes += [chromosome.mutate()]
            }
        }
    }
    
    public func crossover() {
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= mutationRate && index >= 1 {
                let c1 = chromosome.crossover(with: chromosomes[index-1])
                let c2 = chromosomes[index-1].crossover(with: chromosome)
                
                chromosomes += [c1, c2]
            }
        }
    }
    
    public func select() {
        let outcome = selectionMethod.select(population: self)
        chromosomes = outcome.selected
        
        for _ in outcome.discared {
            chromosomes.append(ancestor.new())
        }
    }

    public func evaluate()  {
        chromosomes.forEach { chromosome in
            let chromosomeFitness = fitnessFunction.evaluate(chromosome: chromosome)
            if chromosomeFitness > maxFitness {
                maxFitness = chromosomeFitness
                best = chromosome
            }
        }
    }
    
    // Private function
    private func create() {
        chromosomes = []
        
        for _ in 0...size {
            chromosomes.append(ancestor.new())
        }
        evaluate()
    }
    
    var random: Double {
        return drand48()
    }
    
}
