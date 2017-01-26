//
//  ElitistSelectionMethod.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct ElitistSelectionMethod : GeneticSelectionMethod, CustomStringConvertible {
    public let selectNumber: Int
    
    public init(select: Int) {
        self.selectNumber = select
    }
    
    public func select(population: GeneticPopulation) -> SelectionOutcome {
        let chromosomes = population.chromosomes.sorted { $0.fitness > $1.fitness }
        
        var selected: [GeneticChromosome] = []
        var discared: [GeneticChromosome] = []
        
        for (index, chromosome) in chromosomes.enumerated() {
            if index < selectNumber {
                selected += [chromosome]
            } else {
                discared += [chromosome]
            }
        }
        
        return (selected: selected, discared: discared)
    }
    
    public var description: String {
        return "Elitist selection method with a cut of \(selectNumber) chromosomes"
    }
}
