//
//  GeneticPopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

protocol GeneticPopulationManager {
    
    func createChromosome(from population: GeneticPopulation) -> GeneticChromosome
    func crossover(population: GeneticPopulation)
    func mutate(population: GeneticPopulation)
    func select(population: GeneticPopulation)
    
    func regenerate(population: GeneticPopulation)
    func resize(population: GeneticPopulation, to: Int)
    
}
