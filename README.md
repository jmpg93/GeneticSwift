# GeneticSwift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage) [![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) ![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg) 

## What is GeneticSwift?
__GeneticSwift__ provides basic tools that allows to solve many different problems (optimization, approximation, prediction, etc) by using genetic algorithms.

A simple regression could be made with a single definition of the fitness function:

```swift
private func startRegresion() {
    let ancestor = DoublesChromosome(values: [1, 2, 3],
                                     valuesRange: 0..<10,
                                     multiplierRange: 0..<2,
                                     additionRange: 0..<0.5)
    
    let regressionPoints =  [ Point(1, 1), Point(2, 5), Point(3, 7) ]
    let regressionFunc = DoubleRegressionFitnessFunction<Point>(values: regressionPoints)
    
    let population = Population(ancestor: ancestor,
                                size: 40,
                                fitnessFunction: regressionFunc,
                                selectionMethod: ElitistSelectionMethod(select: 20))
    
    population.delegate = self
    population.next()
}
```
You will get the polynomial: 
```swift
Found P(x) = -0.22 * X^3 + 1.13 * X^2 + 0.97 * X
```
