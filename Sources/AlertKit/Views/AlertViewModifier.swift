//
//  AlertViewModifier.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

struct AlertViewModifier: ViewModifier {
    @EnvironmentObject var alertManager: AlertManager
    let queues: [String]
    
    func body(content: Content) -> some View {
        content
            .overlay(Group {
                if let alert = alertManager.alerts.first(where: { queues.contains($0.queue) }) {
                    AlertCardView(manager: alertManager, alert: alert)
                }
            })
    }
}
