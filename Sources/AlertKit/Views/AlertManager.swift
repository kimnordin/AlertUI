//
//  AlertManager.swift
//
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public class AlertManager: ObservableObject {
    @Published var alerts = [CustomAlert]()
    
    func displayAlert(_ alert: CustomAlert) {
        DispatchQueue.main.async {
            self.alerts.append(alert)
        }
    }
    
    func dismissAlert(_ alert: CustomAlert) {
        if let index = self.alerts.firstIndex(where: { $0.id == alert.id }) {
            DispatchQueue.main.async {
                self.alerts.remove(at: index)
            }
        }
    }
}
