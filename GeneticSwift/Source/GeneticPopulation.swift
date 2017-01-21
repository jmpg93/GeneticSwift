//
//  GeneticPopulation.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticPopulation {
    var population: [GeneticChromosome] { get set }
}
