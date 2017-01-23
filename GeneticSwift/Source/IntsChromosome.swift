//
//  IntsChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class IntsChromosome : Chromosome<Int> {
    public init(values: [Int],
                valuesRange: Range<Int>,
                multiplierRange: Range<Int>,
                additionRange: Range<Int>,
                defaultFitness: Double = 0) {
        
        let chromosomeGenerator = ChromosomeGenerator<Int>(valueRange: valuesRange,
                                                           multiplierRange: multiplierRange,
                                                           additionRange: additionRange)
        
        super.init(values: values, generator: chromosomeGenerator, defaultFitness: defaultFitness)
    }
}
