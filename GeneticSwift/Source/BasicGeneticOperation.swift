//
//  BasicGeneticOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class BasicGeneticOperation: BlockOperation, GeneticOperation {
    public unowned let population: GeneticPopulation
    
    init(population: GeneticPopulation) {
        self.population = population
        super.init()
        
        self.addOperations()
    }
    
    public override var isConcurrent: Bool {
        return false
    }

    public var selectionMethod: GeneticSelectionMethod {
        return population.selectionMethod
    }
    
    public var ancestor: GeneticChromosome {
        return population.ancestor
    }
    
    public var chromosomes: [GeneticChromosome] {
        return population.chromosomes
    }
    
    public var crossoverRate: Double {
        return population.crossoverRate
    }
    
    public var mutationRate: Double {
        return population.mutationRate
    }
    
    public var fitnessFunction: GeneticFitnessFunction {
        return population.fitnessFunction
    }
    
    public var randomRate: Double {
        return drand48()
    }
    
    public var size: Int {
        return population.size
    }
    
    public func addOperations() {
    }
}
