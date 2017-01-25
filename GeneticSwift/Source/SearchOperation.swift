//
//  SearchOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class EndOperation: BasicGeneticOperation {
    public override func addOperations() {
        addExecutionBlock {
            if let delegate = self.population.delegate, !delegate.populationShouldStartNextGeneration(population: self.population) {
                return
            }
            
            self.population.next()
        }
    }
}
