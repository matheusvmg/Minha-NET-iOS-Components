//
//  ViewController.swift
//  Minha-NET-iOS-Components-Example
//
//  Created by Matheus Góes on 08/07/22.
//

import UIKit
import Minha_NET_iOS_Components

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(card)
        self.view.addSubview(card2)
        setupConstraints()
    }

    private lazy var card: CardView = {
        let cardInformation = CardContent(icon: "wifi", title: "Boot", subtitle: "Uptime", description: "Faz mais de 10 dias que você não reinicia seu modem. O que acha da gente fazer um boot?", hasButton: true, buttonTitle: "Agendar visita técnica", isRounded: false)
        let card = CardView()
        card.cardInformation = cardInformation
        return card
    }()
    
    private lazy var card2: CardView = {
        let cardInformation = CardContent(icon: "wifi", title: "Boot", subtitle: "Uptime", description: "Faz mais de 10 dias que você não reinicia seu modem. O que acha da gente fazer um boot?", hasButton: true, buttonTitle: "Agendar visita técnica", isRounded: false)
        let card = CardView()
        card.cardInformation = cardInformation
        return card
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            card.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            card.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            card2.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 50),
            card2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            card2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
    }

}

