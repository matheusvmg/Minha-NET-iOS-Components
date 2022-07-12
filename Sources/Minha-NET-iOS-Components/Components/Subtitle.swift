//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import UIKit

public class Subtitle: UILabel {
    private let subtitleSize: SubtitleSize
    
    public var subtitleText: String = "Subtítulo padrão" {
        didSet {
            self.text = subtitleText
        }
    }
    
    public var isInverse: Bool = false {
        didSet {
            self.textColor = isInverse ? .white : .black
        }
    }
    
    public init(frame: CGRect, size: SubtitleSize = .sm) {
        self.subtitleSize = size
        super.init(frame: frame)
        configureSubtitleComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubtitleComponent() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = subtitleText
        self.font = UIFont.systemFont(ofSize: subtitleSize.rawValue, weight: .medium)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.tintColor = .black
    }
}

extension Subtitle {
    public enum SubtitleSize: CGFloat {
        case md = 24
        case sm = 20
        case xs = 16
    }
}
