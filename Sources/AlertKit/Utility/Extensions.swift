//
//  File.swift
//  
//
//  Created by Kim Nordin on 2024-05-06.
//

import SwiftUI

public extension View {
    func observeAlerts(on queues: [String]) -> some View {
        self.modifier(AlertViewModifier(queues: queues))
    }
}
