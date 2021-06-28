//
//  knn.swift
//  irisKNNandDMC
//
//  Created by Hiago Chagas on 21/06/21.
//

import Foundation

class KNN {
    func calculateDistances(entry: [Double], dataset: [[Any]]) -> [(Double, Int)] {
        //Distance is Double, Index inside of the Dataset is Int
        var distances: [(Double, Int)] = []
        var index = 0
        for data in dataset {
            var sum = 0.0
            for index in 0..<(entry.count) {
                guard let dataValue = data[index] as? Double else { break }
                let result: Double = entry[index] - dataValue
                sum += result * result
            }
            let result = sum.squareRoot()
            distances.append((result, index))
            index += 1
        }
        distances.sort { $0.0 < $1.0 }
        return distances
    }

    func countLabelDistances(k: Int, distances: [(Double, Int)], dataset: [[Any]]) -> [String: Int] {
        var labels: [String: Int] = [:]
        for index in 0..<k {
            let databaseIndex = distances[index].1
            let databaseValues = dataset[databaseIndex]
            guard let databaseLabel = databaseValues.last as? String else { break }
            if let _ = labels[databaseLabel] {
                labels[databaseLabel]! += 1
            } else {
                labels[databaseLabel] = 1
            }
        }
        return labels
    }

    func checkLabel(dict: [String: Int]) -> String {
        var resultLabel: String = ""
        var higher = 0
        for label in dict {
            if (label.value > higher) {
                resultLabel = label.key
                higher = label.value
            }
        }
        return resultLabel
    }
}
