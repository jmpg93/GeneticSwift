//
//  AppDelegate.swift
//  GeneticApp
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Cocoa
import GeneticSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    var regresionPoints: [Point] = []
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        startRegresion()
    }
    
    private func startRegresion() {
        let ancestor = DoublesChromosome(values: [2, 2, 3],
                                         valuesRange: 0..<10,
                                         multiplierRange: 0..<2,
                                         additionRange: 0..<0.5)
        
        let regresionPoints =  [ Point(1, 1), Point(2, 5), Point(3, 7) ]
        let regresionFunc = DoubleRegressionFitnessFunction<Point>(values: regresionPoints)
        
        let population = Population(ancestor: ancestor,
                                    size: 40,
                                    fitnessFunction: regresionFunc,
                                    selectionMethod: ElitistSelectionMethod(select: 20))
        
        population.delegate = self
        population.next()
    }
    
    private func startAproximation() {
        let ancestor = PointsChromosome(values:
            [
                Point(1, 1),
                Point(2, 5),
                Point(3, 7),
                Point(4, 6),
                Point(5, 3)
            ]
        )
        
        // Aproximating func y = 2 * x
        let aprox = AproximationFitnessFunction<Point>(aproximationFunction: { x in
            return x * 2
        })
        
        let population = Population(ancestor: ancestor,
                                    size: 30,
                                    fitnessFunction: aprox,
                                    selectionMethod: ElitistSelectionMethod(select: 15))
        
        population.delegate = self
        population.next()
    }
}

extension AppDelegate : GeneticPopulationDelegate {
    func populationShouldStartNextGeneration(population: GeneticPopulation) -> Bool {
        print("\nGeneration \(population.generation) end with fitness: \(population.best.fitness)\n")
        
        guard population.generation > 400 || population.best.fitness > 200 else {
            return true
        }
        
        
        if let best = population.best as? Chromosome<Point> {
            print("Points for function y = 2 * x: ")
            for value in best.values {
                print("Point: (x:\(value.x), y:\(value.y))")
            }
        }
        
        if let best = population.best as? Chromosome<Double>,
            let regressionFunction = population.fitnessFunction as? DoubleRegressionFitnessFunction<Point>  {
            let function = regressionFunction.stringPolynomialFunction(for: best.values)
            print("Found \(function)")
            
            for point in regresionPoints {
                let itIs = regressionFunction.polynomialFunction(for: best.values, x: point.x).twoDecimals
                let itShouldBe = point.y.twoDecimals
                print("For point: \(point) the regression get \(itIs) and the real value is \(itShouldBe)")
            }
            
            
        }

        
        return false
    }
}

