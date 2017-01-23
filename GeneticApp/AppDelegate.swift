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
        let ancestor = DoublesChromosome(values: [10, 20],valuesRange: 0..<10, multiplierRange: 0..<2, additionRange: 0..<0.5)
        
        let population = Population(ancestor: ancestor,
                                    size: 10,
                                    fitnessFunction: BaseFitnessFunction({ _ in return 0 }),
                                    selectionMethod: ElitistSelectionMethod(selectNumber: 5))
        
        population.delegate = self
        population.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }


}

extension AppDelegate : GeneticPopulationDelegate {
    func populationDidEndPhase(phase: EvolutionPhase, population: GeneticPopulation) {
        print("Phase \(phase) end: \(population)")
    }
    
    func populationShouldStartNextGeneration(popuplation: GeneticPopulation) -> Bool {
        print("Generation end: \(popuplation)")
        
        if popuplation.generation > 30 || popuplation.best.fitness > 10 {
            return false
        }
        
        return true
    }
}

