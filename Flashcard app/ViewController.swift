//
//  ViewController.swift
//  Flashcard app
//
//  Created by Joy olowoniyi on 10/13/18.
//  Copyright © 2018 Joy olowoniyi. All rights reserved.
//

import UIKit
struct Flashcard{
    var question:String
    var answer: String
}
class ViewController: UIViewController {
    
    

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readSavedFlashcards()
        
        if flashcards.count == 0{
        updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia")
        }
            else{
                updateLabels()
                updateNextPrevButtons()
            }

}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapOnFlashCard(_ sender: Any) {
        
        frontLabel.isHidden = true;
        
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    func saveAllFlashcardsToDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String:String] in
            
            return ["question":card.question, "answer":card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to user defaults")
    }
    func updateFlashcard(question :String, answer :String){
        let flashcard = Flashcard(question: question, answer: answer)
          flashcards.append(flashcard)
        
      // frontLabel.text = flashcard.question
       //backLabel.text = flashcard.answer
        
        
        print("added a flshcard")
        print("we now have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print ("our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]{
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
                flashcards.append(contentsOf: savedCards)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsControler = self
    }
  
    @IBAction func didTapOnBack(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        
        updateNextPrevButtons()
        
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == flashcards.count - flashcards.count{
            backButton.isEnabled = false
        }
        else{
            backButton.isEnabled = true
        }

        
    }

}
