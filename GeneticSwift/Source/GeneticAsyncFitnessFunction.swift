//
//  GeneticAsyncFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 24/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol  GeneticAsyncFitnessFunction {
    func evaluate(chromosome: GeneticChromosome, fitnessClosure: @escaping (Double) -> ())
}
