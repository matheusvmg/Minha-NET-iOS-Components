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
        setupConstraints()
    }

    private lazy var card: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: "wifi", title: "Título", subtitle: "Subtítulo", description: "description", hasButton: true, buttonTitle: "título do botão", isRounded: true)
        return card
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            card.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            card.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
    }

}

