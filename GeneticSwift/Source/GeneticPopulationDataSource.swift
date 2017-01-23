//
//  GeneticPopulationDataSource.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulationDataSource {
    func size(for population: GeneticPopulation) -> Int
    func fitnessFunction(for population: GeneticPopulation) -> GeneticFitnessFunction
    func selectionMethod(for population: GeneticPopulation) -> GeneticSelectionMethod
}
