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
            .overlay(
                ZStack {
                    let filteredAlerts = alertManager.alerts.filter { queues.contains($0.queue) }
                    ForEach(filteredAlerts.prefix(5).reversed().indices, id: \.self) { index in
                        AlertCardView(manager: alertManager, alert: alertManager.alerts[index])
                            .offset(x: 0, y: -CGFloat(index * 10))
                            .scaleEffect(1.0 - CGFloat(index) * 0.05)
                            .zIndex(Double(-index))
                            .shadow(color: shadowColor(for: index), radius: shadowRadius(for: index), x: 0, y: shadowYOffset(for: index))
                    }
                }
            )
    }
    
    private func shadowColor(for index: Int) -> Color {
        Color.black.opacity(Double(5 - index) / 5.0)  // More transparent as index increases
    }
    
    private func shadowRadius(for index: Int) -> CGFloat {
        CGFloat(10 - 2 * index)  // Decreases as the card index increases
    }
    
    private func shadowYOffset(for index: Int) -> CGFloat {
        CGFloat(-5 + index)  // Less offset as the card index increases
    }
}
