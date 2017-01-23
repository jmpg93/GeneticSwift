//
//  GeneticChromosomeGenetarot.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticChromosomeGenerator {
    associatedtype Randomizable
    
    var randomFactor: Randomizable { get }
    var newValue: Randomizable { get }
    var newAddition: Randomizable { get }
    var newMultiplier: Randomizable { get }
    var newBalance: Double { get }
    var additionBalancer: Double { get }
    var crossoverBalancer: Double { get }
}

extension GeneticChromosomeGenerator {
    public var newBalance: Double {
        return Double.random(0, 1)
    }
    
    public var additionBalancer: Double {
        return 0.5
    }
    
    public var crossoverBalancer: Double {
        return 0.5
    }
}
