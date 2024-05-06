//
//  AlertManager.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public class AlertManager: ObservableObject {
    @Published var alerts = [CustomAlert]()
    
    public init(alerts: [CustomAlert] = []) {
        self.alerts = alerts
    }
    
    /**
     Adds an alert to the `alerts` stack, displaying it.
     - parameter alert: The `CustomAlert` to add.
     */
    public func displayAlert(_ alert: CustomAlert) {
        DispatchQueue.main.async { [self] in
            alerts.append(alert)
        }
    }
    
    /**
     Dismiss an alert from the `alerts` stack.
     - parameter alert: An optional `CustomAlert` to dismiss.
     
     If no `CustomAlert` was specified, the first alert in the stack will be dismissed.
     */
    public func dismissAlert(_ alert: CustomAlert? = nil) {
        DispatchQueue.main.async { [self] in
            if let alert = alert, let index = alerts.firstIndex(where: { $0.id == alert.id }) {
                alerts.remove(at: index)
            } else {
                alerts.removeFirst()
            }
        }
    }
}
