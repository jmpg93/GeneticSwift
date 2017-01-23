//
//  GeneticPopulationDataSource.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulationDataSource : class {
    func size(for population: GeneticPopulation) -> Int
    func fitnessFunction(for population: GeneticPopulation) -> GeneticFitnessFunction
    func selectionMethod(for population: GeneticPopulation) -> GeneticSelectionMethod
}

extension GeneticPopulationDataSource {
    public func size(for population: GeneticPopulation) -> Int {
        return 0
    }
    
    public func selectionMethod(for population: GeneticPopulation) -> GeneticSelectionMethod {
        return ElitistSelectionMethod(selectNumber: population.size / 2)
    }
}
