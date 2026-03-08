//
//  DOSModifiers.swift
//  DOSBTS
//
//  View modifiers for DOS terminal aesthetic
//

import SwiftUI

extension View {

    /// Applies DOS card styling: warm near-black background with amber border
    public func dosCard() -> some View {
        self
            .background(AmberTheme.cardBackground)
            .overlay(Rectangle().stroke(AmberTheme.amberMuted.opacity(0.3), lineWidth: 1))
    }

    /// Applies DOS text field styling: monospace amber text with amber tint
    public func dosTextField() -> some View {
        self
            .font(DOSTypography.body)
            .foregroundColor(AmberTheme.amber)
            .tint(AmberTheme.amber)
    }
}
