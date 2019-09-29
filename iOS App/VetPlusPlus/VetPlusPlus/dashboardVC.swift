//
//  dashboardVC.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class dashboardVC: UIViewController {
    
    let dashboardLabel = UILabel()
    let goodAfterNoonLabel = UILabel()
    let resourcesLabel = UILabel()
    let resourcesTV = UITextView()
    let topView = UIView()
    let editProfileButton = UIButton()
    
    let housingButton = UIButton()
    let financeButton = UIButton()
    let healthButton = UIButton()
    let buttonStack = UIStackView()
    
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topBarSetup()
        dashboardLabelSetup()
        goodAfterNoonLabelSetup()
        backButtonSetup()
        
        healthButtonSetup()
        financeButtonSetup()
        housingButtonSetup()
        buttonStackSetup()
        editProfileButtonSetup()
    }
    
    func topBarSetup() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topView.backgroundColor = .red
    }
    
    func dashboardLabelSetup() {
        view.addSubview(dashboardLabel)
        dashboardLabel.translatesAutoresizingMaskIntoConstraints = false
        dashboardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        dashboardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dashboardLabel.text = "Dashboard"
        dashboardLabel.font = UIFont.boldSystemFont(ofSize: 20)
        dashboardLabel.textColor = .white
    }
    
    func goodAfterNoonLabelSetup() {
        view.addSubview(goodAfterNoonLabel)
        goodAfterNoonLabel.translatesAutoresizingMaskIntoConstraints = false
        goodAfterNoonLabel.topAnchor.constraint(equalTo: dashboardLabel.bottomAnchor, constant: 5).isActive = true
        goodAfterNoonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goodAfterNoonLabel.text = "Good Afternoon, Alfred!"
        goodAfterNoonLabel.font = UIFont.boldSystemFont(ofSize: 15)
        goodAfterNoonLabel.textColor = .white
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
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        //backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func housingButtonSetup() {
        //view.addSubview(housingButton)
        housingButton.translatesAutoresizingMaskIntoConstraints = false
        //housingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        //housingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        housingButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        housingButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        housingButton.backgroundColor = .blue
        //housingButton.sethousinggroundImage(UIImage(named: "housing"), for: .normal)
        //housingButton.setImage(UIImage(named: "housing"), for: .normal)
        housingButton.addTarget(self, action: #selector(housingButtonTapped), for: .touchUpInside)
    }
    
    @objc func housingButtonTapped() {
        let vc = QuestionVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func financeButtonSetup() {
        //view.addSubview(financeButton)
        financeButton.translatesAutoresizingMaskIntoConstraints = false
        //financeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        //financeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        financeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        financeButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        financeButton.backgroundColor = .blue
        //financeButton.setfinancegroundImage(UIImage(named: "finance"), for: .normal)
        //financeButton.setImage(UIImage(named: "finance"), for: .normal)
        financeButton.addTarget(self, action: #selector(financeButtonTapped), for: .touchUpInside)
    }
    
    @objc func financeButtonTapped() {
        let vc = QuestionVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func healthButtonSetup() {
        //view.addSubview(healthButton)
        healthButton.translatesAutoresizingMaskIntoConstraints = false
        //healthButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        //healthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        healthButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        healthButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        healthButton.backgroundColor = .blue
        //healthButton.sethealthgroundImage(UIImage(named: "health"), for: .normal)
        //healthButton.setImage(UIImage(named: "health"), for: .normal)
        healthButton.addTarget(self, action: #selector(healthButtonTapped), for: .touchUpInside)
    }
    
    @objc func healthButtonTapped() {
        let vc = QuestionVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func editProfileButtonSetup() {
        view.addSubview(editProfileButton)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        editProfileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        //editProfileButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        editProfileButton.backgroundColor = .clear
        editProfileButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        //editProfileButton.backgroundColor = .blue
        editProfileButton.setTitle("...", for: .normal)
    }

    func buttonStackSetup() {
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.distribution = .fillEqually
        buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStack.spacing = 20
        buttonStack.addArrangedSubview(housingButton)
        buttonStack.addArrangedSubview(financeButton)
        buttonStack.addArrangedSubview(healthButton)
    }
    
    
    
}
