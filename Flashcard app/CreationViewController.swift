//
//  CreationViewController.swift
//  Flashcard app
//
//  Created by Joy olowoniyi on 10/27/18.
//  Copyright © 2018 Joy olowoniyi. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    @IBOutlet weak var questionTextLabel: UITextField!
    
    @IBOutlet weak var answerTextLabel: UITextField!
    
    

    var flashcardsControler: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
        }
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextLabel.text
        let answerText = answerTextLabel.text
        flashcardsControler.updateFlashcard(question: questionText!, answer: answerText!)
        dismiss(animated: true)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


