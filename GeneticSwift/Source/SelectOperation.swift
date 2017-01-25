//
//  SelectOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class SelectOperation: BasicGeneticOperation {
    public override func addOperations() {
        addExecutionBlock {
            let outcome = self.selectionMethod.select(population: self.population)
            self.population.rebase(chromosomes: outcome.selected)
        }
    }
}
