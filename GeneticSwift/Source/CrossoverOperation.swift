//
//  CrossoverOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class CrossoverOperation: Operation, GeneticOperation {
    private unowned let c1: GeneticChromosome
    private unowned let c2: GeneticChromosome
    private unowned let population: GeneticPopulation
    
    init(c1: GeneticChromosome, c2: GeneticChromosome, over population: GeneticPopulation) {
        self.c1 = c1
        self.c2 = c2
        self.population = population
    }
    
    public func operation() {
        let (newC1, newC2) = c1.crossover(with: c2)
        
        newC1.evaluate(with: population.fitnessFunction)
        newC2.evaluate(with: population.fitnessFunction)
        
        population.add(chromosome: newC1)
        population.add(chromosome: newC2)
    }
    
    override public func main() {
        if self.isCancelled {
            return
        }
        
        operation()
    }
}
