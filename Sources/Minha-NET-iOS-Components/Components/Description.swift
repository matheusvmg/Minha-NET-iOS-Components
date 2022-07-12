//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import UIKit

public class Description: UILabel {
    private let isTextCaption: Bool
    
    public var descriptionText: String = "Descrição padrão" {
        didSet {
            self.text = descriptionText
        }
    }
    
    public var isInverse: Bool = false {
        didSet {
            self.textColor = isInverse ? .white : .black
        }
    }
    
    public init(frame: CGRect, isTextCaption: Bool = false) {
        self.isTextCaption = isTextCaption
        super.init(frame: frame)
        configureDescriptionComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDescriptionComponent() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = descriptionText
        self.font = UIFont.systemFont(ofSize: isTextCaption ? 12 : 16, weight: .regular)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.tintColor = .black
    }
}
