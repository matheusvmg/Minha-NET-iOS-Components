//
//  Card.swift
//  
//
//  Created by Matheus Góes on 08/07/22.
//

import UIKit

@available(iOS 13.0, *)
public class CardView: UIView {
    public var cardInformation: CardContent? {
        didSet {
            configureCardInternalComponents()
        }
    }
    
    private var isRounded: Bool = true {
        didSet {
            if isRounded {
                makeRoundedCardView()
            } else {
                makeSquaredCardView()
            }
        }
    }
    
    public var cardBackground: CardBackgroundColor = .standard {
        didSet {
            self.backgroundColor = getBackgroundColor(type: cardBackground)
            self.stackview.backgroundColor = getBackgroundColor(type: cardBackground)
        }
    }
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = getBackgroundColor(type: .standard)
        return stackview
    }()
    
    private lazy var iconStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [icon, UIView()])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fill
        stackview.axis = .horizontal
        return stackview
    }()
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "wifi")
        image.tintColor = getBackgroundColor(type: .white)
        return image
    }()
    
    private lazy var titleLabel: Title = {
        let label = Title(frame: .zero, size: .sm)
        label.isInverse = true
        return label
    }()
    
    private lazy var subtitleLabel: Subtitle = {
        let label = Subtitle(frame: .zero, size: .xs)
        label.isInverse = true
        return label
    }()
    
    private lazy var descriptionLabel: Description = {
        let label = Description(frame: .zero)
        label.isInverse = true
        return label
    }()
    
    private lazy var actionButton: StandardButton = {
        let button = StandardButton(frame: .zero)
        button.configureStandardButton(size: .md)
        return button
    }()
    
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = getBackgroundColor(type: .standard)
        self.addSubview(stackview)
        configureStackview()
        setupSpacingBetweenElements()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32)
        ])
    }
    
    private func getDefaultCardInfo() -> CardContent {
        self.isRounded = true
        return CardContent(icon: "wrench.and.screwdriver.fill", title: "Título", subtitle: "Subtítulo", description: "Descrição do componente card.", hasButton: true, buttonTitle: "Título do botão", isRounded: true)
    }
    
    private func makeRoundedCardView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    
    private func makeSquaredCardView() {
        self.clipsToBounds = false
        self.layer.cornerRadius = 0
    }
    
    private func configureCardInternalComponents() {
        guard let cardInformation = cardInformation else { return }
        validateIfElementsGonnaAppearInTheScreen()
        icon.image = UIImage(systemName: cardInformation.icon ?? "")
        titleLabel.titleText = cardInformation.title
        subtitleLabel.subtitleText = cardInformation.subtitle ?? ""
        descriptionLabel.descriptionText = cardInformation.description
        actionButton.buttonTitle = cardInformation.buttonTitle ?? ""
        isRounded = cardInformation.isRounded
    }
    
    private func getBackgroundColor(type: CardBackgroundColor) -> UIColor {
        switch type {
        case .white:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        case .danger:
            return UIColor(red: 0.89, green: 0.15, blue: 0.18, alpha: 1.00)
        case .warning:
            return UIColor(red: 1.00, green: 0.74, blue: 0.29, alpha: 1.00)
        case .standard:
            return UIColor(red: 0.13, green: 0.14, blue: 0.16, alpha: 1.00)
        case .black:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        }
    }
    
    private func configureStackview() {
        self.stackview.addArrangedSubview(iconStackview)
        self.stackview.addArrangedSubview(titleLabel)
        self.stackview.addArrangedSubview(subtitleLabel)
        self.stackview.addArrangedSubview(descriptionLabel)
        self.stackview.addArrangedSubview(actionButton)
        self.stackview.spacing = 32
        self.stackview.distribution = .fill
        self.stackview.axis = .vertical
    }
    
    private func setupSpacingBetweenElements() {
        self.stackview.setCustomSpacing(10, after: iconStackview)
        self.stackview.setCustomSpacing(32, after: titleLabel)
        self.stackview.setCustomSpacing(24, after: subtitleLabel)
        self.stackview.setCustomSpacing(24, after: descriptionLabel)
        self.stackview.setCustomSpacing(32, after: actionButton)
    }
    
    private func validateIfElementsGonnaAppearInTheScreen() {
        guard let cardInformation = cardInformation else { return }
        
        if cardInformation.icon == nil {
            iconStackview.isHidden = true
        }
        
        if cardInformation.subtitle == nil {
            subtitleLabel.isHidden = true
        }
        
        if !cardInformation.hasButton {
            actionButton.isHidden = true
        }
    }
}

@available(iOS 13.0, *)
extension CardView {
    public enum CardBackgroundColor {
        case white
        case danger
        case warning
        case black
        case standard
    }
}
