# GeneticSwift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage) [![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) ![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg) 

## What is GeneticSwift?
__GeneticSwift__ provides basic tools that allows to solve many different problems (optimization, approximation, prediction, etc) by using genetic algorithms.

A simple approximation could be made with a single definition of the fitness function:

```swift
// Aproximating func y = 2 * x
let straightFunction = BaseFitnessFunction { chromosome in
    guard let chromosome = chromosome as? Chromosome<Point> else {
        fatalError()
    }
    
    var fitness: Double = 5000
    
    for value in chromosome.values {
        if value.x < 1 || value.y < 1 {
            fitness -= 1000
            continue
        }
		
        let shouldBe = 2*value.x
        let itIs = value.y
        
        let delta = shouldBe - itIs
        
        fitness -= Double(abs(delta))
    }
    
    return fitness
}

let population = Population(ancestor: ancestor,
                            size: 30,
                            fitnessFunction: straightFunction,
                            selectionMethod: ElitistSelectionMethod(selectNumber: 15))
        
population.delegate = self
population.start()
```
