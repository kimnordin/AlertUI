//
//  AlertContainer.swift
//
//
//  Created by Kim Nordin on 2024-05-07.
//

import SwiftUI

public struct AlertContainer<Content: View>: View {
    @EnvironmentObject var alertManager: AlertManager
    
    let queues: [String]
    var content: ((AlertView) -> Content)?
    
    public init(queues: [String] = ["main"]) where Content == EmptyView {
        self.queues = queues
    }
    
    public init(queues: [String] = ["main"], content: (((AlertView)) -> Content)? = nil) {
        self.queues = queues
        self.content = content
    }

    public var body: some View {
        VStack {
            let filteredAlerts = alertManager.alerts.filter { queues.contains($0.queue) }
            ForEach(filteredAlerts) { alert in
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
    }
}

struct AlertContainer_Previews: PreviewProvider {
    static var previews: some View {
        AlertContainer { alert in
            alert
        }
    }
}
