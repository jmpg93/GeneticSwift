//
//  RandomizeOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class RandomizeOperation: BasicGeneticOperation {
    public override func addOperations() {
        let emptySlots = size - chromosomes.count
        
        for index in 0...emptySlots where index > 0 {
            addExecutionBlock {
                let random = self.ancestor.new()
                random.evaluate(with: self.fitnessFunction)
                
                self.population.add(chromosome: random)
            }
        }
    }
}
