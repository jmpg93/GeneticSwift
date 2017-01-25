//
//  Chromosome.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class Chromosome<T: Randomizable> : GeneticChromosome, CustomStringConvertible {
    open var fitness: Double
    open var evaluated: Bool = false
    
    open private(set) var values: [T] = []
    
    private let generator: ChromosomeGenerator<T>
    
    private var randomIndex: Int {
        return Int.random(0, values.count - 1)
    }
    
    public init(values: [T], generator: ChromosomeGenerator<T>, defaultFitness: Double = 0) {
        self.values = values
        self.generator = generator
        self.fitness = defaultFitness
    }
    
    open func crossover(with chromosome: GeneticChromosome) -> (c1: GeneticChromosome, c2: GeneticChromosome)  {
        guard let chromosome = chromosome as? Chromosome<T>, chromosome.values.count == values.count else {
            fatalError()
        }
        
        let size = values.count - 1
        
        var values1 = chromosome.values
        var values2 = values
        
        if generator.newBalance < generator.crossoverBalancer {
            
            let crossoverIndex = generator.randomIndex(values)
            for index in 0...size where index >= crossoverIndex {
                let temp = values1[index]
                values1[index] = values2[index]
                values2[index] = temp
            }
            
        } else {
            let factor = generator.randomFactor
            for index in 0...size {
                let portion = (values2[index] - values1[index]) * factor
                values1[index] = values1[index] + portion
                values2[index] = values2[index] - portion
            }
        }
        
        return (Chromosome<T>(values: values1, generator: generator),
                Chromosome<T>(values: values2, generator: generator))
    }
    
    open func mutate() -> GeneticChromosome {
        let mutationIndex = randomIndex
        var mutatedValues = values
        
        if generator.newBalance < generator.additionBalancer {
            mutatedValues[mutationIndex] = mutatedValues[mutationIndex] * generator.multiplierGenerator.random
        } else {
            mutatedValues[mutationIndex] = mutatedValues[mutationIndex] + generator.additionGenerator.random
        }
        
        return Chromosome<T>(values: mutatedValues, generator: generator)
    }
    
    open func new() -> GeneticChromosome {
        let newValues = values.map({ _ in generator.newValue })
        return Chromosome<T>(values: newValues, generator: generator)
    }
    
    public var description: String {
        return "Chromosome with \(values.count) values and \(fitness) fitness"
    }
}
