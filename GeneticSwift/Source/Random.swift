//
//  Random.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public protocol Randomizable {
    static func random(_ lower: Self, _ upper: Self) -> Self
    static func + (m1: Self, m2: Self) -> Self
    static func * (m1: Self, m2: Self) -> Self
    static func - (m1: Self, m2: Self) -> Self
    
    static var randomUnitFactor: Self { get }
}

extension Int : Randomizable {
    
    /// SwiftRandom extension
    public static func random(_ lower: Int = 0, _ upper: Int = 1) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public static var randomUnitFactor: Int {
        return random(-1, 1)
    }
}

extension Int32 : Randomizable {
    public static func random(_ lower: Int32 = 0, _ upper: Int32 = 1) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
    
    public static var randomUnitFactor: Int32 {
        return random(-1, 1)
    }
}

extension Double : Randomizable {
    public static func random(_ lower: Double = 0, _ upper: Double = 1) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
    
    public static var randomUnitFactor: Double {
        return random(-1, 1)
    }
}

extension Float : Randomizable {
    public static func random(_ lower: Float = 0, _ upper: Float = 1) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
    
    public static var randomUnitFactor: Float {
        return random(-1, 1)
    }
}
