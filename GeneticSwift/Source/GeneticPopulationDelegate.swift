//
//  GeneticPopulationDelegate.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation


public protocol GeneticPopulationDelegate : class {
    func populationDidEndPhase(phase: EvolutionPhase, population: GeneticPopulation)
    func populationShouldStartNextGeneration(popuplation: GeneticPopulation) -> Bool
}

public extension GeneticPopulationDelegate {
    func populationDidEndPhase(phase: EvolutionPhase, population: GeneticPopulation) { }
    
    public func populationShouldStartNextGeneration(popuplation: GeneticPopulation) -> Bool {
        return true
    }
}
