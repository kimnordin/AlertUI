//
//  AlertKitError.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import Foundation

public struct AlertAction {
    var title: String = "okayButtonTitle"
    var action: (() -> Void)
}

public struct CustomAlert {
    let id = UUID()
    var message: String = ""
    var buttonTitle: String = ""
    var alertAction: AlertAction?
    var queue: String = "main"
}
