//
//  MutationOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class MutateOperation: BasicGeneticOperation {
    public override func addOperations() {
        for (index, chromosome) in chromosomes.enumerated() where index < size {
            if randomRate <= crossoverRate {
                addExecutionBlock {
                    let mutatedChromosome = chromosome.mutate()
                    mutatedChromosome.evaluate(with: self.fitnessFunction)
                    
                    self.population.add(chromosome: mutatedChromosome)
                }
            }
        }
    }
}
