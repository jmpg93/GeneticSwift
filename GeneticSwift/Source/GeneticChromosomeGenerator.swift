//
//  GeneticChromosomeGenerator.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct ChromosomeGenerator<T: Randomizable> {
    let valueGenerator: GeneticRandomGenerator<T>
    let additionGenerator: GeneticRandomGenerator<T>
    let multiplierGenerator: GeneticRandomGenerator<T>
    
    public init(valueGenerator: GeneticRandomGenerator<T>, multiplierGenerator: GeneticRandomGenerator<T>, additionGenerator: GeneticRandomGenerator<T>) {
        self.valueGenerator = valueGenerator
        self.additionGenerator = additionGenerator
        self.multiplierGenerator = additionGenerator
    }
    
    public func randomIndex(_ values: [T]) -> Int {
       return Int.random(0, values.count)
    }

    public var randomFactor: T {
        return T.randomFactor
    }
    
    public var newValue: T {
        return valueGenerator.random
    }
    
    public var newAddition: T {
        return additionGenerator.random
    }
    
    public var newMultiplier: T {
        return multiplierGenerator.random
    }
    
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

public extension ChromosomeGenerator where T: Comparable & Equatable {
    public init(valueRange: Range<T>, multiplierRange: Range<T>, additionRange: Range<T>) {
        self.valueGenerator = GeneticRandomGenerator<T>(lower: valueRange.lowerBound, upper: valueRange.upperBound)
        self.additionGenerator = GeneticRandomGenerator<T>(lower: additionRange.lowerBound, upper: additionRange.upperBound)
        self.multiplierGenerator = GeneticRandomGenerator<T>(lower: multiplierRange.lowerBound, upper: multiplierRange.upperBound)
    }
}
