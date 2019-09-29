//
//  dashboardVC.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class dashboardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath) as! UITableViewCell
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if category == "housing" {
            let vc = webView()
            vc.urlLink = housingLinks[indexPath.row]
            //vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        } else if category == "finance" {
            let vc = webView()
            vc.urlLink = financeLinks[indexPath.row]
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        } else if category == "health" {
            let vc = webView()
            vc.urlLink = healthLinks[indexPath.row]
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        }
    }
    
    let housingListing = ["Veterans Affair - Call Center","Veterans Affair - Housing Assistance","Veterans Affair - HUD-VASH","Volunteers of America: Carolinas","Supportive Services for Veteran Families"]
    
    let housingLinks = ["https://www.va.gov/homeless/nationalcallcenter.asp","https://www.va.gov/housing-assistance/","https://www.va.gov/homeless/hud-vash.asp","https://www.voacarolinas.org/gethelp-maplecrt","https://www.va.gov/homeless/ssvf/"]
            
    let healthListing = ["Veterans Affair - Health Care"]
    
    let healthLinks = ["https://www.va.gov/homeless/ssvf/"]
            
    let financeListing = ["Veterans Affair - Pension"]
    
    let financeLinks = ["https://www.va.gov/pension/eligibility/"]
    
    var array = [String]()
    let messageLabel = UITextView()
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
    
    
    let tableView = UITableView()
    var category = String()
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if category == "housing" {
            array = housingListing
        } else if category == "finance" {
            array = financeListing
        } else if category == "health" {
            array = healthListing
        }
        topBarSetup()
        dashboardLabelSetup()
        goodAfterNoonLabelSetup()
        backButtonSetup()
        
        healthButtonSetup()
        financeButtonSetup()
        housingButtonSetup()
        buttonStackSetup()
        editProfileButtonSetup()
        tableViewSetup()
        messageLabelSetup()
    }
    
    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
        if array.count == 0 {
            tableView.isHidden = true
        }
    }
    
    func topBarSetup() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
        goodAfterNoonLabel.text = "Good Afternoon"
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
    
    func messageLabelSetup() {
        view.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        messageLabel.text = "Please selecet a category to get results"
        if array.count != 0 {
            messageLabel.isHidden = true
        }
        messageLabel.isEditable = false
        messageLabel.textAlignment = .center
        
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
        //housingButton.backgroundColor = .blue
        //housingButton.sethousinggroundImage(UIImage(named: "housing"), for: .normal)
        housingButton.setImage(UIImage(named: "Housing"), for: .normal)
        housingButton.addTarget(self, action: #selector(housingButtonTapped), for: .touchUpInside)
    }
    
    @objc func housingButtonTapped() {
        let vc = QuestionVC()
        vc.category = "housing"
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
        //financeButton.backgroundColor = .blue
        financeButton.setBackgroundImage(UIImage(named: "Financial"), for: .normal)
        //financeButton.setImage(UIImage(named: "finance"), for: .normal)
        financeButton.addTarget(self, action: #selector(financeButtonTapped), for: .touchUpInside)
    }
    
    @objc func financeButtonTapped() {
        let vc = QuestionVC()
        vc.category = "finance"
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
        //healthButton.backgroundColor = .blue
        //healthButton.sethealthgroundImage(UIImage(named: "health"), for: .normal)
        healthButton.setImage(UIImage(named: "Health"), for: .normal)
        healthButton.addTarget(self, action: #selector(healthButtonTapped), for: .touchUpInside)
    }
    
    @objc func healthButtonTapped() {
        let vc = QuestionVC()
        vc.category = "health"
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
        buttonStack.spacing = 40
        buttonStack.addArrangedSubview(housingButton)
        buttonStack.addArrangedSubview(financeButton)
        buttonStack.addArrangedSubview(healthButton)
    }
    
    
    
}
