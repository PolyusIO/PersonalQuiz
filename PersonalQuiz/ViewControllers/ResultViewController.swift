//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    // MARK: - Public Properties
    var answers: [Answer]!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        hideBackButton()
        showResult()
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func showResult() {
        let animal = findMostFrequentAnimal(from: answers)
        emojiLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
    private func findMostFrequentAnimal(from answers: [Answer]) -> AnimalType {
        var frequentAnimals: [AnimalType: Int] = [:]
        answers.forEach { answer in
            let animal = answer.type
            frequentAnimals[animal, default: 0] += 1
            }
        let mostFrequentAnimal = frequentAnimals
            .sorted { $0.value > $1.value}
            .first?.key ?? .cat
        return mostFrequentAnimal
    }
    
    private func hideBackButton() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
    }
}
