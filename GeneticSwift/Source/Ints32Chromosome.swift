//
//  Ints32Chromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class Ints32Chromosome : Chromosome<Int32> {
    public init(values: [Int32],
                valuesRange: Range<Int32>,
                multiplierRange: Range<Int32>,
                additionRange: Range<Int32>,
                defaultFitness: Double = 0) {
        
        let chromosomeGenerator = ChromosomeGenerator<Int32>(valueRange: valuesRange,
                                                           multiplierRange: multiplierRange,
                                                           additionRange: additionRange)
        
        super.init(values: values, generator: chromosomeGenerator, defaultFitness: defaultFitness)
    }
}
