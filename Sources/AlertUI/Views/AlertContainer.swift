//
//  AlertContainer.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-07.
//

import SwiftUI

public enum AlertContainerAppearance {
    case ´default´, list
}

public struct AlertContainer<Content: View>: View {
    @EnvironmentObject var alertManager: AlertManager
    
    let queues: [String]
    let appearance: AlertContainerAppearance
    var content: ((AlertView) -> Content)?
    
    public init(queues: [String] = ["main"], appearance: AlertContainerAppearance = .´default´) where Content == EmptyView {
        self.queues = queues
        self.appearance = appearance
    }
    
    public init(queues: [String] = ["main"], appearance: AlertContainerAppearance = .´default´, content: (((AlertView)) -> Content)? = nil) {
        self.queues = queues
        self.appearance = appearance
        self.content = content
    }

    public var body: some View {
        let filteredAlerts = alertManager.alerts.filter { queues.contains($0.queue) }
        switch appearance {
        case .´default´:
            if let alert = filteredAlerts.last {
                AlertViewContent(content, alert: alert)
            }
        case .list:
            VStack {
                ForEach(filteredAlerts) { alert in
                    AlertViewContent(content, alert: alert)
                }
            }
        }
    }
    
    @ViewBuilder private func AlertViewContent(_ content: ((AlertView) -> Content)?, alert: Alert) -> some View {
        if let content = content {
            content(AlertView(alertManager, alert: alert))
        } else {
           AlertView(alertManager, alert: alert)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(5)
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.easeOut, value: alertManager.alerts)
        }
    }
}

struct AlertContainer_Previews: PreviewProvider {
    static var previews: some View {
        AlertContainer { alert in
            alert
        }
    }
}
