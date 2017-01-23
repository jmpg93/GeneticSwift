//
//  GeneticChromosomeGenerator.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct ChromosomeGenerator<T: Randomizable> : GeneticChromosomeGenerator {

    let valueGenerator: RandomGenerator<T>
    let additionGenerator: RandomGenerator<T>
    let multiplierGenerator: RandomGenerator<T>
    
    public init(valueGenerator: RandomGenerator<T>, multiplierGenerator: RandomGenerator<T>, additionGenerator: RandomGenerator<T>) {
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
}

public extension ChromosomeGenerator where T: Comparable & Equatable {
    public init(valueRange: Range<T>, multiplierRange: Range<T>, additionRange: Range<T>) {
        self.valueGenerator = RandomGenerator<T>(lower: valueRange.lowerBound, upper: valueRange.upperBound)
        self.additionGenerator = RandomGenerator<T>(lower: additionRange.lowerBound, upper: additionRange.upperBound)
        self.multiplierGenerator = RandomGenerator<T>(lower: multiplierRange.lowerBound, upper: multiplierRange.upperBound)
    }
}
