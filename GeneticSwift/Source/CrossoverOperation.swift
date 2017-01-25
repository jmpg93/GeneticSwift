//
//  CrossoverOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class CrossoverOperation: BasicGeneticOperation {
    public override func addOperations() {
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if random <= mutationRate && index >= 1 {
                addExecutionBlock {
                    let (c1, c2) = chromosome.crossover(with: self.chromosomes[index-1])
                    
                    c1.evaluate(with: self.fitnessFunction)
                    c2.evaluate(with: self.fitnessFunction)
                    
                    self.population.add(chromosome: c1)
                    self.population.add(chromosome: c2)
                }
            }
        }
    }
}
