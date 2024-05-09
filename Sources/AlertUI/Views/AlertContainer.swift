//
//  AlertContainer.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-07.
//

import SwiftUI

/**
 ### Alert Container Appearance
 
 The visual behaviour of `AlertView`'s displayed in the `AlertContainer`.
 */
public enum AlertContainerAppearance {
    /// Displays `AlertView`'s on top of each other.
    case ´default´
    
    /// Displays `AlertView`'s as a list.
    case list
}

/**
 ### Alert Container
 
 Manages the displaying of `AlertView`'s based on specified queues and appearance.
 */
public struct AlertContainer<Content: View>: View {
    @EnvironmentObject var alertManager: AlertManager
    
    /**
     An array of identifiers that the `AlertContainer` listens for.
     
     `Alert`'s matching these queues are displayed by the `AlertContainer`.
     - note: The default queue  is `["main"]`.
     */
    let queues: [String]
    
    /**
     The visual behaviour of the `AlertView`'s displayed in the `AlertContainer`.
     - note: The default appearance is `.default`, displaying `AlertView`'s on top of each other.
     */
    let appearance: AlertContainerAppearance
    
    /**
     An optional closure defining custom content for the displayed `Alert`'s.
     
     This closure receives an `AlertView` as its parameter and returns a `View` that is used to render the custom alert content.
     - note: If no content is specified the `AlertContainer` will use a default appearance for the `AlertView`'s.
     */
    var content: ((AlertView) -> Content)?
    
    
    /**
     Initializes an `AlertContainer` without custom content
     This initializer is used when no specific customization of the alert content is necessary.

     - parameter queues: An array of strings identifying the queues this container should monitor. Defaults to `["main"]`.
     - parameter appearance: The visual style for the alert presentations. Defaults to `.default`.

     This initializer configures the container to either show the most recent alert or all alerts based on the appearance,
     without any customization of the alert's content.
     */
    public init(queues: [String] = ["main"], appearance: AlertContainerAppearance = .´default´) where Content == EmptyView {
        self.queues = queues
        self.appearance = appearance
    }
    
    /**
     Initializes an `AlertContainer` with the ability to define custom content for each alert.
     This allows for a highly customizable alert presentation depending on the content provided.
     
     - parameter queues: An array of strings identifying the queues this container should monitor. Defaults to `["main"]`.
     - parameter appearance: The visual style for the alert presentations. Defaults to `.default`.
     - parameter content: An optional closure that takes an `AlertView` and returns a `View`. This parameter allows for
     customizing the content of each alert based on the `Alert`'s data.

     This initializer is ideal when you need to present alerts with customized content beyond the default view,
     such as adding buttons, images, or complex layouts within each alert.
     */
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
