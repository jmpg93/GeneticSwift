//
//  MutationOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class MutationOperation: Operation, GeneticOperation {
    private unowned let chromocome: GeneticChromosome
    private unowned let population: GeneticPopulation
    
    init(chromocome: GeneticChromosome, over population: GeneticPopulation) {
        self.chromocome = chromocome
        self.population = population
    }
    
    public func operation() {
        let newChromocome = chromocome.mutate()
        newChromocome.evaluate(with: population.fitnessFunction)
        population.add(chromosome: newChromocome)
    }
    
    override public func main() {
        if self.isCancelled {
            return
        }
        
        operation()
    }
}
