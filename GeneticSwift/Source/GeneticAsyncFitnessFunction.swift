//
//  GeneticAsyncFitnessFunction.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 24/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

//TODO: Check
public protocol  GeneticAsyncFitnessFunction : GeneticFitnessFunction {
    func evaluate(chromosome: GeneticChromosome, fitnessClosure: @escaping (Double) -> ())
}
