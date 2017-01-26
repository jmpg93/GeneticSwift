//
//  EndOperation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class SearchOperation: BasicGeneticOperation {
    public override func addOperations() {
        addExecutionBlock {
            self.population.updateBestChromosome()
        }
    }
}
