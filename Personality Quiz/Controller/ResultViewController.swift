//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by Kairzhan Kural on 8/10/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        reload()
    }
  
    private func reload() {
        var frequencyOfAnimals: [AnimalType : Int] = [:]
        let animals = responses.map { $0.type }
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFreqencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        
        guard let mostFrequencyAnimal = sortedFreqencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = animal.definition
    }

}
