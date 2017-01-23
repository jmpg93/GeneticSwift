//
//  GeneticMutationGenerator.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct GeneticRandomGenerator<T: Randomizable> {
    public let lower: T
    public let upper: T
    
    public init(lower: T, upper: T) {
        self.lower = lower
        self.upper = upper
    }
    
    public var random: T {
        return T.random(lower, upper)
    }
}
