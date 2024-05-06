//
//  AlertCardView.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public struct AlertCardView: View {
    @ObservedObject var manager: AlertManager
    var alert: CustomAlert

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
                Button(role: .cancel, action: {
                    manager.dismissAlert(alert)
                }, label: {
                    Text(alert.buttonTitle)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                })
                if let alertAction = alert.alertAction {
                    Button(role: .destructive, action: {
                        alertAction.action()
                    }, label: {
                        Text(alertAction.title)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    })
                }
            }
        }
        .padding()
        .frame(minWidth: 150, maxWidth: .infinity, minHeight: 50)
        .background(Color.green)
        .cornerRadius(10)
    }
}
struct AlertCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCardView(manager: AlertManager(), alert: CustomAlert(title: "Alert Title", message: "Longer Descriptive Alert Message", buttonTitle: "Okay"))
    }
}
