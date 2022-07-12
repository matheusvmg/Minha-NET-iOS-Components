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
    
    private lazy var centeredTitle: Title = {
        let label = Title(frame: .zero, size: .xl)
        label.titleText = "Componentes iOS Mondrian"
        return label
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
    
    private lazy var cardsTitle: Title = {
        let label = Title(frame: .zero, size: .lg)
        label.titleText = "Tipos de Cards:"
        return label
    }()

    private lazy var card: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: nil, title: "Rede", subtitle: "Escolha a melhor rede", description: "Seu modem pode ter sido reiniciado e está com as configuração de fábrica. Você pode reestabelecer sua conexão configurando novamente sua rede Wi-Fi.", hasButton: true, buttonTitle: "Reiniciar equipamento", isRounded: true, statusType: .notAvailable)
        return card
    }()
    
    private lazy var card2: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: nil, title: "Ative a Rede Unificada", subtitle: nil, description: "Seu equipamento está desatualizado. Isso afeta a qualidade e a velocidade do seu sinal. Agende a troca do seu equipamento, ela é isenta de cobranças.", hasButton: true, buttonTitle: "Agendar troca de equipamento", isRounded: true, statusType: .none)
        return card
    }()
    
    private lazy var card3: CardView = {
        let cardInformation = CardContent(icon: nil, title: "Está tudo certo por aí agora?", subtitle: nil, description: nil, hasButton: true, buttonTitle: "Ainda não", isRounded: true, statusType: .none)
        let aditionalView = StandardButton()
        aditionalView.configureStandardButton(size: .md)
        aditionalView.buttonTitle = "Tudo certo"
        let card = CardView(aditionalView: aditionalView)
        card.cardInformation = cardInformation
        return card
    }()
    
    private lazy var card4: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: nil, title: "MP | Motor", subtitle: nil, description: "Vamos trabalhar nas respostas para ficar mais amigável para o cliente (mostra um código XXXX e uma mensagem técnica) - Classificar os códigos", hasButton: false, buttonTitle: nil, isRounded: true, statusType: .available)
        return card
    }()
    
    private lazy var card5: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: "wifi", title: "Opa! Você já tem uma solicitação aberta para solucionar um problema em seus produtos", subtitle: nil, description: "Verifique se existe alguma visita técnica em aberto ou pendente de agendamento.", hasButton: true, buttonTitle: "Link para as visitas", isRounded: true, statusType: .none)
        return card
    }()
    
    private lazy var card6: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: "wifi", title: "Fique atento", subtitle: nil, description: "Podemos verificar a distância seu problema, não gostaria de fazer uma verificação antes de abrir uma VT... Lembre-se que pode ser gerado um custo adicional....", hasButton: false, buttonTitle: nil, isRounded: true, statusType: .none)
        return card
    }()
    
    private lazy var card7: CardView = {
        let card = CardView()
        card.cardInformation = CardContent(icon: nil, title: "Erro ao Resetar seu modem", subtitle: nil, description: nil, hasButton: true, buttonTitle: "Voltar para as verificações", isRounded: true, statusType: .none)
        return card
    }()
    
    private lazy var buttonsTitle: Title = {
        let label = Title(frame: .zero, size: .lg)
        label.titleText = "Tipos de Botões:"
        return label
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
            
            centeredTitle.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 10),
            centeredTitle.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            centeredTitle.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            
            verticalStackview.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 120),
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
        verticalStackview.addArrangedSubview(cardsTitle)
        verticalStackview.addArrangedSubview(card)
        verticalStackview.addArrangedSubview(card2)
        verticalStackview.addArrangedSubview(card3)
        verticalStackview.addArrangedSubview(card4)
        verticalStackview.addArrangedSubview(card5)
        verticalStackview.addArrangedSubview(card6)
        verticalStackview.addArrangedSubview(card7)
        verticalStackview.addArrangedSubview(buttonsTitle)
        verticalStackview.addArrangedSubview(button2)
        verticalStackview.addArrangedSubview(button3)
        verticalStackview.addArrangedSubview(button4)
        scrollview.addSubview(verticalStackview)
        scrollview.addSubview(centeredTitle)
        scrollview.addSubview(button)
        self.view.addSubview(scrollview)
    }

}

