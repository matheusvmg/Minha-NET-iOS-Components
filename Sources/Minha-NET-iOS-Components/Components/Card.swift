//
//  Card.swift
//  
//
//  Created by Matheus Góes on 08/07/22.
//

import UIKit

public class Card: UIView {
    public var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    public var descriptionText: String = "" {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    public var actionButtonTitle: String = "" {
        didSet {
            actionButton.setTitle(actionButtonTitle, for: .normal)
        }
    }
    
    public var hasButton: Bool = true {
        didSet {
            if !hasButton {
                actionButton.isHidden = true
            }
        }
    }
    
    public var isRounded: Bool = false {
        didSet {
            if isRounded {
                self.clipsToBounds = true
                self.layer.cornerRadius = 8
            }
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titleText
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = descriptionText
        label.textColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(actionButtonTitle, for: .normal)
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.16, alpha: 1.00)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(actionButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32)
        ])
    }
}
