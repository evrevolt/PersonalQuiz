//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDectionaryLabel: UILabel!
    
    //Из сигвея данные
    var results: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResults()
    }
    
    //Высчитываем результаты
    private func updateResults() {
        //Сколько раз кол-во животных встречается
        var countsOfAnimals = [AnimalType: Int]()
        var animals = [AnimalType]()
        
        for result in results {
            animals.append(result.type)
        }
        
        for animal in animals {
            
            countsOfAnimals[animal] = (countsOfAnimals[animal] ?? 0) + 1
        }
//                Вариант №2
//            if animal == .dog {
//                var dogCount = countsOfAnimals[.dog]! + 1
//                dogCount = countsOfAnimals.updateValue(dogCount, forKey: .dog)!
         
        let sortedCountOfAnimals = countsOfAnimals.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedCountOfAnimals.first?.key else { return }
        
        updateUI(animal: resultAnimal)
    }
    
    //Обновляем лейблы
    private func updateUI(animal: AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDectionaryLabel.text = "\(animal.definition)"
    }
 
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
