//
//  EvolutionPhase.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 22/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public enum EvolutionPhase : CustomStringConvertible {
    case randomize
    case crossover
    case mutation
    case search
    case selection
    case end
    case none
    
    public var next: EvolutionPhase {
        switch self {
        case .randomize:
            return .crossover
        case .crossover:
            return .mutation
        case .mutation:
            return .search
        case .search:
            return .selection
        case .selection:
            return .end
        case .end:
            return .none
        case .none:
            return .none
        }
    }
    
    public var description: String {
        switch self {
        case .randomize:
            return "Randomize"
        case .crossover:
            return "Crossover"
        case .mutation:
            return "Mutation"
        case .search:
            return "Search"
        case .selection:
            return "Selection"
        case .end:
            return "End"
        case .none:
            return "None"
        }
    }
}
