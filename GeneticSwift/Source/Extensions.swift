//
//  Extensions.swift
//  GeneticSwift
//
//  Created by Jose Maria Puerta on 23/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func safelySync<T>(execute work: () throws -> T) rethrows -> T {
        if Thread.isMainThread {
            return try work()
        } else {
            return try DispatchQueue.main.sync(execute: work)
        }
    }
}

extension Collection {
    
    func chunk(withDistance distance: IndexDistance) -> [[SubSequence.Iterator.Element]] {
        var index = startIndex
        let iterator: AnyIterator<Array<SubSequence.Iterator.Element>> = AnyIterator {
            defer {
                index = self.index(index, offsetBy: distance, limitedBy: self.endIndex) ?? self.endIndex
            }
            
            let newIndex = self.index(index, offsetBy: distance, limitedBy: self.endIndex) ?? self.endIndex
            let range = index ..< newIndex
            return index != self.endIndex ? Array(self[range]) : nil
        }
        
        return Array(iterator)
    }
    
}
