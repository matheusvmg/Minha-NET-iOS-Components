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
        self.view.backgroundColor = .lightGray
        setupSubviews()
        setupConstraints()
    }
    
    private lazy var scrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.isScrollEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
    
    private lazy var verticalStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 15
        stackview.distribution = .fill
        stackview.axis = .vertical
        return stackview
    }()
    
    private lazy var title1: Title = {
        let label = Title(frame: .zero, size: .sm)
        return label
    }()
    
    private lazy var title2: Title = {
        let label = Title(frame: .zero, size: .sm)
        label.isInverse = true
        return label
    }()
    
    private lazy var subtitle1: Subtitle = {
        let label = Subtitle(frame: .zero, size: .sm)
        return label
    }()
    
    private lazy var subtitle2: Subtitle = {
        let label = Subtitle(frame: .zero, size: .sm)
        label.isInverse = true
        return label
    }()
    
    private lazy var description1: Description = {
        let label = Description(frame: .zero)
        return label
    }()
    
    private lazy var description2: Description = {
        let label = Description(frame: .zero, isTextCaption: true)
        return label
    }()

    private lazy var card: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: "wifi", title: "Título", subtitle: "Subtítulo", description: "description", hasButton: true, buttonTitle: "título do botão", isRounded: true)
        return card
    }()
    
    private lazy var card2: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: "wifi", title: "Título", subtitle: "Subtítulo", description: "description", hasButton: true, buttonTitle: "título do botão", isRounded: false)
        card.cardBackground = .warning
        return card
    }()
    
    private lazy var button: StandardButton = {
        let button = StandardButton(frame: .zero)
        button.buttonTitle = "Continuo com problemas"
        button.configureFilledButton(size: .lg, background: .danger)
        return button
    }()
    
    private lazy var button2: StandardButton = {
        let button = StandardButton(frame: .zero)
        button.buttonTitle = "Continuo com problemas"
        button.configureStandardButton(size: .lg)
        return button
    }()
    
    private lazy var button3: StandardButton = {
        let button = StandardButton(frame: .zero)
        button.buttonTitle = "Continuo com problemas"
        button.configureFilledButton(size: .sm, background: .warning)
        return button
    }()
    
    private lazy var button4: StandardButton = {
        let button = StandardButton(frame: .zero)
        button.buttonTitle = "Continuo com problemas"
        button.configureFilledButton(size: .md, background: .white)
        return button
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            verticalStackview.topAnchor.constraint(equalTo: scrollview.topAnchor),
            verticalStackview.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            verticalStackview.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            verticalStackview.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            
            button.topAnchor.constraint(equalTo: verticalStackview.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor, constant: -32)
        ])
    }
    
    private func setupSubviews() {
        verticalStackview.addArrangedSubview(title1)
        verticalStackview.addArrangedSubview(title2)
        verticalStackview.addArrangedSubview(subtitle1)
        verticalStackview.addArrangedSubview(subtitle2)
        verticalStackview.addArrangedSubview(description1)
        verticalStackview.addArrangedSubview(description2)
        verticalStackview.addArrangedSubview(card)
        verticalStackview.addArrangedSubview(card2)
        verticalStackview.addArrangedSubview(button2)
        verticalStackview.addArrangedSubview(button3)
        verticalStackview.addArrangedSubview(button4)
        scrollview.addSubview(verticalStackview)
        scrollview.addSubview(button)
        self.view.addSubview(scrollview)
    }

}

