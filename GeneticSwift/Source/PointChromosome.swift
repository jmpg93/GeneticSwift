//
//  PointChromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class PointsChromosome : Chromosome<Point> {
    public init(values: [Point]) {
        let vg =  RandomGenerator<Point>(lower: Point(0, 0), upper: Point(30, 30))
        let mg =  RandomGenerator<Point>(lower: Point(0, 0), upper: Point(2, 2))
        let ag =  RandomGenerator<Point>(lower: Point(0, 0), upper: Point(1, 1))
        
        let chromosomeGenerator = ChromosomeGenerator<Point>(valueGenerator: vg,
                                                             multiplierGenerator: mg,
                                                             additionGenerator: ag)
        
        super.init(values: values, generator: chromosomeGenerator, defaultFitness: 0)
    }
}
