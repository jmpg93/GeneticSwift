//
//  WheelSelectionMethod.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct WheelSelectionMethod : GeneticSelectionMethod, CustomStringConvertible {
    
    public func select(population: GeneticPopulation) -> SelectionOutcome {
        fatalError()
        return (selected: [], discared: [])
    }
    
    public var description: String {
        return "Rank selection method"
    }
}
