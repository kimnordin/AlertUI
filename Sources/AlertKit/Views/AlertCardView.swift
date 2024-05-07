//
//  AlertCardView.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public struct AlertCardView: View {
    @ObservedObject var manager: AlertManager
    var alert: Alert

    public var body: some View {
        VStack(spacing: 10) {
            Text(alert.title)
                .bold()
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Text(alert.message)
                .lineLimit(3)
                .multilineTextAlignment(.center)
            HStack(alignment: .center) {
                Spacer()
                let primaryAction = alert.primaryAction
                Button {
                    primaryAction.action?()
                    if primaryAction.shouldDismiss {
                        manager.dismissAlert(alert)
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
                            manager.dismissAlert(alert)
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
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .cornerRadius(10)
        .padding()
    }
}
struct AlertCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCardView(manager: AlertManager(), alert: Alert(title: "Alert Title", message: "Longer Descriptive Alert Message"))
    }
}
