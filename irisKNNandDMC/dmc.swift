//
//  dmc.swift
//  irisKNNandDMC
//
//  Created by Hiago Chagas on 18/06/21.
//

import Foundation

class DMC {
    func calculateCentroids(dataset: [[Any]]) -> [String:[Double]] {
        var resultDictionary: [String:[Double]] = [:]
        var quantityDictionary: [String:Double] = [:]
        for data in dataset {
            guard let label = data.last as? String else { break }
            if quantityDictionary[label] == nil {
                quantityDictionary[label] = 1.0
            } else {
                quantityDictionary[label] = quantityDictionary[label]! + 1.0
            }
            var index = 0
            for value in data {
                if(index >= 0) {
                    if(resultDictionary[label] == nil) {
                        resultDictionary[label] = []
                        resultDictionary[label]?.append(value as! Double)
                    } else if (resultDictionary[label]!.count < data.count - 1) {
                        resultDictionary[label]?.insert(value as! Double, at: index - 1)
                    } else if (index < data.count - 1) {
                        resultDictionary[label]?[index] += value as! Double
                    }
                }
                index += 1
            }
        }
        for quantity in quantityDictionary {
            let label = quantity.key
            let value = quantity.value
            for index in 0..<resultDictionary[label]!.count {
                resultDictionary[label]?[index] /= value
            }
        }
        return resultDictionary
    }
    
    func calculateDistances(entry: [Double], centroids: [String:[Double]]) -> String {
        var results: [(String, Double)] = []
        for centroid in centroids {
            let key = centroid.key
            let value = centroid.value
            var sum: Double = 0.0
            for index in 0..<value.count {
                let result = value[index] - entry[index]
                sum += result * result
            }
            let distance = sum.squareRoot()
            results.append((key, distance))
        }
        results.sort { $0.1 < $1.1 }
        return results[0].0
    }
}


