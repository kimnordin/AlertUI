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
            Text(alert.message)
            HStack {
                Button(role: .cancel, action: {
                    manager.dismissAlert(alert)
                }, label: {
                    Text(.init(alert.buttonTitle))
                })
                if let alertAction = alert.alertAction {
                    Button(role: .destructive, action: {
                        alertAction.action()
                    }, label: {
                        Text(.init(alertAction.title))
                    })
                }
            }
        }
    }
}

struct AlertCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCardView(manager: AlertManager(), alert: CustomAlert(title: "Alert Title", message: "Longer Descriptive Alert Message", buttonTitle: "Okay"))
    }
}
