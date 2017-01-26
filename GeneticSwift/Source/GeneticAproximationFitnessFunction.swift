//
//  Optimization.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 26/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticAproximationFitnessFunction : GeneticFitnessFunction {
    associatedtype ChomosomeValue
    
    var aproximationFunction: AproximationFunctionBlock { get }
}
