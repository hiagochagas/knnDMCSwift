//
//  main.swift
//  irisKNNandDMC
//
//  Created by Hiago Chagas on 17/06/21.
//

import Foundation

let dataset = Dataset.dataset

let knn = KNN()
let dmc = DMC()

let k = 5

let flowerSetosa = [5.1, 3.5, 1.4, 0.2]
let flowerVersicolor = [6.7, 3.1, 4.7, 1.5]
let flowerVirginica = [6.3, 2.7, 4.9, 1.8]

let flower = flowerSetosa

let distances = knn.calculateDistances(entry: flower, dataset: dataset)
//print(distances)
let dict = knn.countLabelDistances(k: k, distances: distances, dataset: dataset)
//print(dict)
let knnResult = knn.checkLabel(dict: dict)
print(knnResult)

let centroids = dmc.calculateCentroids(dataset: dataset)
//print(centroids)
let dmcResult = dmc.calculateDistances(entry: flower, centroids: centroids)
print(dmcResult)
