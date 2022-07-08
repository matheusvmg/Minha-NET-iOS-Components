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

    private lazy var card: Card = {
        let card = Card()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.isRounded = true
        card.titleText = "MP | Motor"
        card.descriptionText = "Vamos trabalhar nas respostas para ficar mais amigável para o cliente (mostra um código XXXX e uma mensagem técnica) - Classificar os códigos"
        card.actionButtonTitle = "Auto Diagnóstico"
        card.background = UIColor(red: 0.13, green: 0.14, blue: 0.16, alpha: 1.00)
        return card
    }()
    
    private lazy var card2: Card = {
        let card = Card()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.isRounded = false
        card.titleText = "Ative a Rede Unificada"
        card.descriptionText = "Seu equipamento está desatualizado. Isso afeta a qualidade e a velocidade do seu sinal. Agende a troca do seu equipamento, ela é isenta de cobranças."
        card.actionButtonTitle = "Agendar troca de equipamento"
        card.background = UIColor(red: 1.00, green: 0.74, blue: 0.29, alpha: 1.00)
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

