//
//  DoublesChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class DoublesChromosome : Chromosome<Double> {
    public init(values: [Double],
                valuesRange: Range<Double>,
                multiplierRange: Range<Double>,
                additionRange: Range<Double>,
                defaultFitness: Double = 0) {
        
        let chromosomeGenerator = ChromosomeGenerator<Double>(valueRange: valuesRange,
                                                              multiplierRange: multiplierRange,
                                                              additionRange: additionRange)
        
        super.init(values: values, generator: chromosomeGenerator, defaultFitness: defaultFitness)
    }
}
