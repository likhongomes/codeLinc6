//
//  QuestionVC.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    let questionLabel = UITextView()
    let responseTextField = UITextField()
    let nextButton = UIButton()
    
    var x = 0
    
    let housingQuestions:Array<String> = ["Are you currently staying somewhere?",
                                   "Are you satisfied with current place of living?",
                                   "Are you looking for a place to stay temporarity?","Are you looking for a permanent housing?",
                                   ]
    
    let financeQuestions:Array<String> = ["Have you served active duty?", "Are a veteran with dishonored discharge?",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        questionLabelSetup()
        responseTextFieldSetup()
        nextButtonSetup()
        
        
    }
    
    func questionLabelSetup() {
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        questionLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //questionLabel.backgroundColor = .black
        //questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionLabel.text = housingQuestions[0]
        questionLabel.font = UIFont.boldSystemFont(ofSize: 15)
        questionLabel.textColor = .black
    }
    
    func responseTextFieldSetup() {
        view.addSubview(responseTextField)
        responseTextField.translatesAutoresizingMaskIntoConstraints = false
        responseTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        responseTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10).isActive = true
        responseTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        responseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        responseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        responseTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        responseTextField.layer.borderWidth = 0.5
        responseTextField.placeholder = "Response"
    }
    
    func nextButtonSetup() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        nextButton.backgroundColor = .red
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    @objc func nextButtonTapped() {
        
        if x <=  housingQuestions.count-1 {
            print(x)
            questionLabel.text = housingQuestions[x]
        } else {
            print("asdf")
        }
        x += 1
        
    }


}
