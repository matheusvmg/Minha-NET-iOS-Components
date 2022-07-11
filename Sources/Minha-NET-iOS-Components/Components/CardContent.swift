//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import Foundation

public struct CardContent {
    public init(icon: String?, title: String, subtitle: String?, description: String, hasButton: Bool, buttonTitle: String?, isRounded: Bool) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.hasButton = hasButton
        self.buttonTitle = buttonTitle
        self.isRounded = isRounded
    }
    
    public let icon: String?
    public let title: String
    public let subtitle: String?
    public let description: String
    public let hasButton: Bool
    public let buttonTitle: String?
    public let isRounded: Bool
}
