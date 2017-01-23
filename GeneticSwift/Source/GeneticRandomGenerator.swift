//
//  GeneticRandomGenerator.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol GeneticRandomGenerator {
    associatedtype Randomizable
    
    var lower: Randomizable { get }
    var upper: Randomizable { get }
    
    var random: Randomizable  { get }
}

