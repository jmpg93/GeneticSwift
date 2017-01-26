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
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        /*
         Point(1, 2),
         Point(2, 4),
         Point(3, 6),
         Point(4, 8),
         Point(5, 10)
         */
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
        let exp = AproximationFitnessFunction<Point>(aproximationFunction: { x in
            return x * 2
        })
        
        let population = Population(ancestor: ancestor,
                                    size: 30,
                                    fitnessFunction: exp,
                                    selectionMethod: ElitistSelectionMethod(select: 15))
        
        population.delegate = self
        population.next()
    }
}

extension AppDelegate : GeneticPopulationDelegate {
    func populationShouldStartNextGeneration(population: GeneticPopulation) -> Bool {
        print("\nGeneration \(population.generation) end with fitness: \(population.best.fitness) (5000 max)\n")
        
        if population.generation > 200 || population.best.fitness > 4998 {
            
            print("Points for function y = 2 * x: ")
            if let best = population.best as? Chromosome<Point> {
                for value in best.values {
                    print("Point: (x:\(value.x), y:\(value.y))")
                }
            }
            
            return false
        }
        
        return true
    }
}

