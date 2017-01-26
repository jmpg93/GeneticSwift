//
//  PopulationManager.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 21/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

open class Population : GeneticPopulation, GeneticPopulationDelegate {
    
    open let size: Int
    open let fitnessFunction: GeneticFitnessFunction
    open let selectionMethod: GeneticSelectionMethod
    
    open weak var delegate: GeneticPopulationDelegate? = nil
    
    open var ancestor: GeneticChromosome
    open var best: GeneticChromosome
    
    open var phase: GenerationPhase
    open var generation: Int
    
    private let lock: DispatchQueue = DispatchQueue(label: "lock")
    private var _chromosomes: [GeneticChromosome]
    open var chromosomes: [GeneticChromosome] {
        get { return lock.sync { _chromosomes } }
        set { lock.sync { _chromosomes = newValue } }
    }
    
    private let queue: OperationQueue
    
    public init(ancestor: GeneticChromosome, size: Int, fitnessFunction: GeneticFitnessFunction, selectionMethod: GeneticSelectionMethod) {
        self.size = size
        self.fitnessFunction = fitnessFunction
        self.selectionMethod = selectionMethod
        
        self.queue = OperationQueue()
        self.queue.maxConcurrentOperationCount = 1

        self.ancestor = ancestor
        self.best = ancestor
        
        self.phase = .none
        self.generation = 0
        
        self._chromosomes = []
    }
    
    open func pause() {
        queue.isSuspended = true
    }
    
    open func resume() {
        queue.isSuspended = false
    }
    
    open func next() {
        generation += 1
        
        randomize()
        mutate()
        crossover()
        select()
        search()
        end()
    }
    
    open func randomize() {
        queue.addOperation(
            RandomizeOperation(population: self)
        )
    }
    
    open func mutate() {
        queue.addOperation(
            MutateOperation(population: self)
        )
    }
    
    open func crossover() {
        queue.addOperation(
            CrossoverOperation(population: self)
        )
    }
    
    open func select() {
        queue.addOperation(
            SelectOperation(population: self)
        )
    }
    
    open func search() {
        queue.addOperation(
            SearchOperation(population: self)
        )
    }
    
    open func end() {
        queue.addOperation(
            EndOperation(population: self)
        )
    }
    
    public func updateBestChromosome() {
        for chromosome in chromosomes {
            if chromosome.fitness > best.fitness {
                best = chromosome
            }
        }
    }
    
    public func add(chromosome: GeneticChromosome) {
        self.chromosomes += [chromosome]
    }
    
    public func rebase(chromosomes: [GeneticChromosome]) {
        self.chromosomes = chromosomes
    }
}
