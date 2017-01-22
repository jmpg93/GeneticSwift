//
//  GeneticPopulationDelegate.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation


public protocol GeneticPopulationDelegate {
    func populationDidEndRandomize(popuplation: GeneticPopulation)
    func populationDidEndMutation(popuplation: GeneticPopulation)
    func populationDidEndCrossover(popuplation: GeneticPopulation)
    func populationDidEndEvaluation(popuplation: GeneticPopulation)
    func populationDidEndSelection(popuplation: GeneticPopulation)
    
    func populationShouldStartNextGeneration(popuplation: GeneticPopulation) -> Bool
}

public extension GeneticPopulationDelegate {
    public func populationDidEndRandomize(popuplation: GeneticPopulation) { }
    public func populationDidEndMutation(popuplation: GeneticPopulation) { }
    public func populationDidEndCrossover(popuplation: GeneticPopulation) { }
    public func populationDidEndEvaluation(popuplation: GeneticPopulation) { }
    public func populationDidEndSelection(popuplation: GeneticPopulation) { }
    
    public func populationShouldStartNextGeneration(popuplation: GeneticPopulation) -> Bool {
        return true
    }
}
