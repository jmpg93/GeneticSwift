//
//  GeneticPopulationDelegate.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulationDelegate : class {
    func populationDidEndPhase(phase: GenerationPhase, population: GeneticPopulation)
    func populationShouldStartNextGeneration(population: GeneticPopulation) -> Bool
}

public extension GeneticPopulationDelegate {
    func populationDidEndPhase(phase: GenerationPhase, population: GeneticPopulation) { }
    
    public func populationShouldStartNextGeneration(population popuplation: GeneticPopulation) -> Bool {
        return true
    }
}
