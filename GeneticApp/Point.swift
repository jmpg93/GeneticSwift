//
//  Point.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import GeneticSwift

public struct Point: CustomStringConvertible {
    
    public var description: String {
        return "(\(x), \(y))"
    }
    
    public let x: Int
    public let y: Int
    
    public init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point : Randomizable {
    public static func random(_ lower: Point, _ upper: Point) -> Point {
        let x = Int.random(lower.x, upper.x)
        let y = Int.random(lower.y, upper.y)
        
        return Point(x, y)
    }
    
    public static func + (m1: Point, m2: Point) -> Point {
        return Point(m1.x + m2.x, m2.y + m1.y)
    }
    
    public static func * (m1: Point, m2: Point) -> Point {
        return Point(m1.x * m2.x, m2.y * m1.y)
    }
    
    public static func - (m1: Point, m2: Point) -> Point {
        return Point(m1.x * m2.x, m2.y * m1.y)
    }
    
    
    public static var randomFactor: Point {
        let x = Int.random(0, 1)
        let y = Int.random(0, 1)
        
        return Point(x, y)
    }
}

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
