//
//  ElitistSelectionMethod.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct ElitistSelectionMethod : GeneticSelectionMethod {
    public func select(population: GeneticPopulation) -> SelectionOutcome {
        var maxFitness: Double = 0
        var best = population.best
        
        population.chromosomes.forEach { chromosome in
            let chromosomeFitness = population.fitnessFunction.evaluate(chromosome: chromosome)
            if chromosomeFitness > maxFitness {
                maxFitness = chromosomeFitness
                best = chromosome
            }
        }
        
        //TODO: Select
        return (selected: [], discared: [], best: best, maxFitness: maxFitness)
    }
}
