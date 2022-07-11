//
//  File.swift
//  
//
//  Created by Matheus Góes on 11/07/22.
//

import Foundation

public struct CardContent {
    let icon: String?
    let title: String
    let subtitle: String?
    let description: String
    let hasButton: Bool
    let buttonTitle: String?
    let isRounded: Bool
    let statusType: StatusType
    
    public init(icon: String?, title: String, subtitle: String?, description: String, hasButton: Bool, buttonTitle: String?, isRounded: Bool, statusType: StatusType) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.hasButton = hasButton
        self.buttonTitle = buttonTitle
        self.isRounded = isRounded
        self.statusType = statusType
    }
}
