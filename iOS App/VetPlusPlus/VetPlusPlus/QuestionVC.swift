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
    let yesButton = UIButton()
    let noButton = UIButton()
    let responseTextField = UITextField()
    let nextButton = UIButton()
    var isHidden = true
    var resultBools = [Bool]()
    var x = 0
    var category = String()
    var array = [String]()
    let backButton = UIButton()
    
    //let housingQuestions:Array<String> = ["Are you currently staying somewhere?",
                                 //  "Are you satisfied with current place of living?",
                                   //"Are you looking for a place to stay temporarity?","Are you looking for a permanent housing?"]
    
    //let financeQuestions:Array<String> = ["Have you served active duty?", "Are a veteran with dishonored discharge?",""]
    
    let housingQuestions:Array<String> = ["Are you currently staying somewhere?","Are you satisfied with current place of living?","Are you experiencing homelessness?","Are you looking for a place to stay temporarily?","Are you looking for transitional housing?","Are you looking for aid in renting a home?","Does your income exceed 50% of your area’s median income?","Are you currently in housing and in danger of becoming homeless?","Are you scheduled to move into housing within 90 days?","Are you looking for a permanent housing?","Are you currently in housing and in danger of becoming homeless?","Are you a veteran with a dishonorable discharge?","Are you timing out of transitional housing?"]
            
    let healthQuestions:Array<String> = ["Have you served active duty?", "Are a veteran with dishonored discharge?","Have you received financial compensation (payments) from VA for a service-connected disability?","Were you discharged for a disability resulting from something that happened to you in the line of duty?","Were you discharged for a disability that got worse in the line of duty?","Are you a recently discharged combat Veteran?","Have you gotten a VA pension?","Are you a former prisoner of war (POW)?","Have you received a Purple Heart?","Have you received a Medal of Honor?","Have you gotten (or been qualified for) Medicaid benefits?","Have you served in Vietnam between January 9, 1962, and May 7, 1975?","Have you served in Southwest Asia during the Gulf War between August 2, 1990, and November 11, 1998?","Have you served at least 30 days at Camp Lejeune between August 1, 1953, and December 31, 1987?"
                ]
            
    let financeQuestions:Array<String> = ["Are you a veteran with a dishonorable discharge?","Have you started on active duty before September 8, 1980, and you served at least 90 days on active duty with at least 1 day during wartime?","Have you started on active duty as an enlisted person after September 7, 1980, and served at least 24 months or the full period for which you were called or ordered to active duty (with some exceptions) with at least 1 day during wartime?","Were you an officer and started on active duty after October 16, 1981, and you hadn’t previously served on active duty for at least 24 months?", "Are you at least 65 years old?","Have you had a permanent and total disability?","Are you a patient in a nursing home for long-term care because of a disability?","Are you getting Social Security Disability Insurance or Supplemental Security Income?"
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if category == "housing" {
            array = housingQuestions
        } else if category == "finance" {
            array = financeQuestions
        } else if category == "health" {
            array = healthQuestions
        }
        questionLabelSetup()
        responseTextFieldSetup()
        noButtonSetup()
        yesButtonSetup()
        backButtonSetup()
    }
    
    func backButtonSetup() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.backgroundColor = .clear
        backButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        //backButton.backgroundColor = .blue
        backButton.setBackgroundImage(UIImage(named: "blackBack"), for: .normal)
        //backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
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
        questionLabel.text = array[0]
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
        responseTextField.isHidden = isHidden
        responseTextField.placeholder = "Response"
    }
    
    func yesButtonSetup() {
        view.addSubview(yesButton)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yesButton.bottomAnchor.constraint(equalTo: noButton.topAnchor, constant: -10).isActive = true
        yesButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        yesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        yesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        yesButton.backgroundColor = .red
        yesButton.setTitle("yes", for: .normal)
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
    }

    @objc func yesButtonTapped() {
        
        if x <=  array.count-1 {
            print(x)
            questionLabel.text = array[x]
        } else {
            let vc = dashboardVC()
            vc.category = category
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
            
        }
        x += 1
    }
    
    func noButtonSetup() {
        view.addSubview(noButton)
        noButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        noButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        noButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        noButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        noButton.backgroundColor = .red
        noButton.setTitle("no", for: .normal)
        noButton.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
    }
    
    @objc func noButtonTapped() {
        if x <=  array.count-1 {
            questionLabel.text = array[x]
        } else {
            let vc = dashboardVC()
            vc.category = category
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        }
        x += 1
    }
    
    


}
