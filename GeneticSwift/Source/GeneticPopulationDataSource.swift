//
//  GeneticPopulationDataSource.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulationDataSource {
    func sizeForPopulation(ancestor: Chromosome) -> Int
    func fitnessFunction(ancestor: Chromosome) -> GeneticFitnessFunction
    func selectionMethod(ancestor: Chromosome) -> GeneticSelectionMethod
}
