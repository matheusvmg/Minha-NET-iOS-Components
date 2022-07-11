//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import UIKit

public class Title: UILabel {
    private let titleSize: TitleSize
    
    public var titleText: String = "Título padrão" {
        didSet {
            self.text = titleText
        }
    }
    
    public var isInverse: Bool = false {
        didSet {
            self.textColor = isInverse ? .white : .black
        }
    }
    
    public init(frame: CGRect, size: TitleSize = .sm) {
        self.titleSize = size
        super.init(frame: frame)
        configureTitleComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitleComponent() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = titleText
        self.font = UIFont.systemFont(ofSize: titleSize.rawValue, weight: .medium)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textColor = .black
    }
}

extension Title {
    public enum TitleSize: CGFloat {
        case xl = 36
        case lg = 32
        case md = 28
        case sm = 24
        case xs = 20
    }
}
