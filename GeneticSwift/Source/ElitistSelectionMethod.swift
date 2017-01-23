//
//  ElitistSelectionMethod.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct ElitistSelectionMethod : GeneticSelectionMethod {
    public let selectNumber: Int
    
    init(selectNumber: Int) {
        self.selectNumber = selectNumber
    }
    
    public func select(population: GeneticPopulation) -> SelectionOutcome {
        let chromosomes = population.chromosomes.sorted { $0.fitness > $1.fitness }
        let slices = chromosomes.chunk(withDistance: selectNumber)
        
        return (selected: slices[0], discared: slices[1])
    }
}
