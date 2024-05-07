//
//  Alert.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public struct AlertAction {
    var title: String
    var action: (() -> Void)?
    var shouldDismiss: Bool
    
    public init(title: String, action: (() -> Void)? = nil, shouldDismiss: Bool = true) {
        self.title = title
        self.action = action
        self.shouldDismiss = shouldDismiss
    }
}

public struct Alert: Identifiable {
    public let id = UUID()
    var title: String
    var message: String?
    var backgroundColor: Color
    var primaryAction: AlertAction
    var secondaryAction: AlertAction?
    var queue: String = "main"
    
    public init(title: String, message: String? = nil, backgroundColor: Color = .gray.opacity(0.5), primaryAction: AlertAction = AlertAction(title: "Okay"), secondaryAction: AlertAction? = nil, queue: String = "main") {
        self.title = title
        self.message = message
        self.backgroundColor = backgroundColor
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.queue = queue
    }
}

extension Alert: Equatable {
    public static func == (lhs: Alert, rhs: Alert) -> Bool {
        return lhs.id == rhs.id
    }
}
