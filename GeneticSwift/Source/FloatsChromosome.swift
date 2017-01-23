//
//  FloatChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class FloatsChromosome : Chromosome<Float> {
    public init(values: [Float],
                valuesRange: Range<Float>,
                multiplierRange: Range<Float>,
                additionRange: Range<Float>,
                defaultFitness: Double = 0) {
        
        let chromosomeGenerator = ChromosomeGenerator<Float>(valueRange: valuesRange,
                                                              multiplierRange: multiplierRange,
                                                              additionRange: additionRange)
        
        super.init(values: values, generator: chromosomeGenerator, defaultFitness: defaultFitness)
    }
}
