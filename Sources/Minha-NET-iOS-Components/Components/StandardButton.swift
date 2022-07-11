//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import UIKit

public class StandardButton: UIButton {
    public var buttonTitle: String = "Título do botão" {
        didSet {
            self.setTitle(buttonTitle, for: .normal)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureStandardButton(size: ButtonTypes) {
        self.setTitle(buttonTitle, for: .normal)
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        self.layer.borderColor = UIColor.white.cgColor
        
        switch size {
        case .lg:
            configureLargeButton()
        case .md:
            configureMediumButton()
        case .sm:
            configureSmallButton()
        }
    }
    
    public func configureFilledButton(size: ButtonTypes, background: ButtonFilledType) {
        self.setTitle(buttonTitle, for: .normal)
        self.clipsToBounds = true
        self.backgroundColor = getButtonBackground(type: background)
        self.setTitleColor(getTitleColor(type: background), for: .normal)
        self.layer.borderColor = UIColor.clear.cgColor
        
        switch size {
        case .lg:
            configureLargeButton()
        case .md:
            configureMediumButton()
        case .sm:
            configureSmallButton()
        }
    }
    
    private func configureSmallButton() {
        self.layer.cornerRadius = 15
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        self.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    private func configureMediumButton() {
        self.layer.cornerRadius = 20
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func configureLargeButton() {
        self.layer.cornerRadius = 25
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func getButtonBackground(type: ButtonFilledType) -> UIColor {
        switch type {
        case .danger:
            return UIColor(red: 0.89, green: 0.15, blue: 0.18, alpha: 1.00)
        case .warning:
            return UIColor(red: 1.00, green: 0.74, blue: 0.29, alpha: 1.00)
        case .white:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        case .none:
            return .clear
        }
    }
    
    private func getTitleColor(type: ButtonFilledType) -> UIColor {
        switch type {
        case .danger:
            return UIColor(red: 1.00, green: 0.74, blue: 0.29, alpha: 1.00)
        case .warning:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .white:
            return UIColor(red: 0.89, green: 0.15, blue: 0.18, alpha: 1.00)
        case .none:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        }
    }
}

extension StandardButton {
    public enum ButtonTypes {
        case lg
        case md
        case sm
    }

    public enum ButtonFilledType {
        case danger
        case warning
        case white
        case none
    }
}
