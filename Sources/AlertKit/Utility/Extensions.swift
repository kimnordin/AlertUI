//
//  Extensions.swift
//  AlertKit
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public extension View {
    func observeAlerts(on queues: [String], appearance: AlertAppearance = .default) -> some View {
        self.modifier(AlertViewModifier(queues: queues, appearance: appearance))
    }
}
