//
//  RandomizeOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class RandomizeOperation: Operation, GeneticOperation {
    private unowned let ancestor: GeneticChromosome
    private unowned let population: GeneticPopulation
    
    init(ancestor: GeneticChromosome, over population: GeneticPopulation) {
        self.ancestor = ancestor
        self.population = population
    }
    
    public func operation() {
        let new = ancestor.new()
        new.evaluate(with: population.fitnessFunction)
        population.add(chromosome: new)
    }
    
    override public func main() {
        if self.isCancelled {
            return
        }
        
        operation()
    }
}
