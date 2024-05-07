//
//  Alert.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import Foundation

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

public struct Alert {
    let id = UUID()
    var title: String
    var message: String
    var primaryAction: AlertAction
    var secondaryAction: AlertAction?
    var queue: String = "main"
    
    public init(title: String, message: String, primaryAction: AlertAction = AlertAction(title: "Okay"), secondaryAction: AlertAction? = nil, queue: String = "main") {
        self.title = title
        self.message = message
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.queue = queue
    }
}
