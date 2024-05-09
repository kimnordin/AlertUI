//
//  Alert.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

/**
 ### Alert Action
 
 Encapsulates the details and behavior of an action that can be taken by a presented `Alert`.
 Each action is represented by a button in the `AlertView`.
 */
public struct AlertAction {
    /// Title of the button.
    var title: String
    
    /// An optional action to perform when pressing the button.
    var action: (() -> Void)?
    
    /// Indicates whether the action should dismiss the `Alert` it belongs to.
    var shouldDismiss: Bool
    
    /**
     Initializes an `AlertAction`.
     - parameter title: The title of the button.
     - parameter action: An optional closure that defines actions to perform when the button is pressed.
     - parameter shouldDismiss: Whether the action should dismiss the `Alert` it belongs to. Defaults to `true`.
     */
    public init(title: String, action: (() -> Void)? = nil, shouldDismiss: Bool = true) {
        self.title = title
        self.action = action
        self.shouldDismiss = shouldDismiss
    }
}

/**
 ### Alert
 
 Represents the `Alert` details displayed by an `AlertView`.
 */
public struct Alert: Identifiable {
    public let id = UUID()
    /// Title of the `Alert`.
    var title: String
    
    /// An optional message of the `Alert`.
    var message: String?
    
    /// The primary `AlertAction` associated with the `Alert`.
    var primaryAction: AlertAction
    
    /// An optional secondary `AlertAction` associated with the `Alert`.
    var secondaryAction: AlertAction?
    
    /// The queue associated with the `Alert`.
    var queue: String = "main"
    
    /**
     Initializes an `Alert`.
     - parameter title: The title of the `Alert`.
     - parameter message: An optional message of the `Alert`.
     - parameter primaryAction: The primary `AlertAction` associated with the `Alert`. Defaults to `AlertAction(title: "Okay")`.
     - parameter secondaryAction: An optional secondary `AlertAction` associated with the `Alert`.
     - parameter queue: The queue associated with the `Alert`. Defaults to `"main"`.
     */
    public init(title: String, message: String? = nil, primaryAction: AlertAction = AlertAction(title: "Okay"), secondaryAction: AlertAction? = nil, queue: String = "main") {
        self.title = title
        self.message = message
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
