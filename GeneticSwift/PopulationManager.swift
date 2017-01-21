//
//  PopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct PopulationManager : GeneticPopulationManager {
    public let size: Int
    public let fitnessFunction: GeneticFitnessFunction
    public let selectionMethod: GeneticSelectionMethod
    
    init(size: Int, fitnessFunction: GeneticFitnessFunction, selectionMethod: GeneticSelectionMethod) {
        self.size = size
        self.fitnessFunction = fitnessFunction
        self.selectionMethod = selectionMethod
    }
}
