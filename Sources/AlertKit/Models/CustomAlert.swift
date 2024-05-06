//
//  AlertKitError.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import Foundation

public struct AlertAction {
    var title: String
    var action: (() -> Void)
}

public struct CustomAlert {
    let id = UUID()
    var title: String
    var message: String
    var buttonTitle: String
    var alertAction: AlertAction?
    var displayed: Bool = true
    var queue: String = "main"
    
    public init(title: String, message: String, buttonTitle: String, alertAction: AlertAction? = nil, displayed: Bool = true, queue: String = "main") {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
        self.alertAction = alertAction
        self.displayed = displayed
        self.queue = queue
    }
}
