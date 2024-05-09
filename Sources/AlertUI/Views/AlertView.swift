//
//  AlertView.swift
//  AlertUI
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

/**
 ### Alert View
 
 Displays the visual representation of an individual `Alert`.
 
 The `AlertView` can display a title, an optional message, and up to two action buttons.
 */
public struct AlertView: View {
    @ObservedObject var alertManager: AlertManager
    public var alert: Alert
    
    /**
     Initializes an `AlertView` with an `AlertManager` and the `Alert` content to display.
     - parameter alertManager: An `AlertManager` to manage the displayed `Alert`. Primarily used to dismiss the referenced `Alert` when the `shouldDismiss` parameter of the `Alert` is `true`.
     - parameter alert: The `Alert` with the content that will be displayed by the `AlertView`.
     */
    init(_ alertManager: AlertManager, alert: Alert) {
        self.alertManager = alertManager
        self.alert = alert
    }

    public var body: some View {
        VStack(spacing: 10) {
            Text(alert.title)
                .bold()
                .lineLimit(2)
                .multilineTextAlignment(.center)
            if let alertMessage = alert.message {
                Text(alertMessage)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
            }
            HStack(alignment: .center) {
                Spacer()
                let primaryAction = alert.primaryAction
                Button {
                    primaryAction.action?()
                    if primaryAction.shouldDismiss {
                        alertManager.dismiss(alert)
                    }
                } label: {
                    Text(primaryAction.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                if let secondaryAction = alert.secondaryAction {
                    Button {
                        secondaryAction.action?()
                        if secondaryAction.shouldDismiss {
                            alertManager.dismiss(alert)
                        }
                    } label: {
                        Text(secondaryAction.title)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(AlertManager(), alert: Alert(title: "Alert Title", message: "Longer Descriptive Alert Message"))
            .environmentObject(AlertManager())
    }
}
