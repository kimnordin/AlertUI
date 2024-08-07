//
//  AlertManager.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

/**
 ## Alert Manager
 
 Manages and displays `Alert`'s.
 */
public class AlertManager: ObservableObject {
    /// The displayed `Alert`'s.
    @Published public var alerts = [Alert]()
    
    /**
     Initializes an `AlertManager` with initial `Alert`'s.
     - parameter alerts: The initial `Alert`'s to be added to the `AlertManager`.
     */
    public init(alerts: [Alert] = []) {
        self.alerts = alerts
    }
    
    /**
     Adds an alert to the `alerts` stack, displaying it.
     - parameter alert: The `Alert` to add.
     */
    public func display(_ alert: Alert) {
        DispatchQueue.main.async { [self] in
            alerts.append(alert)
        }
    }
    
    /**
     Dismiss an alert from the `alerts` stack.
     - parameter alert: An optional `Alert` to dismiss.
     
     If no `Alert` was specified, the first alert in the stack will be dismissed.
     */
    public func dismiss(_ alert: Alert? = nil) {
        DispatchQueue.main.async { [self] in
            if let alert = alert, let index = alerts.firstIndex(where: { $0.id == alert.id }) {
                alerts.remove(at: index)
            } else if !alerts.isEmpty {
                alerts.removeFirst()
            }
        }
    }
}
