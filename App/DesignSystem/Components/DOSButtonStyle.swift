//
//  DOSButtonStyle.swift
//  DOSBTS
//
//  eiDotter-inspired button style with CGA amber aesthetic
//

import SwiftUI

/// DOS/CGA terminal button style with sharp corners and amber palette
struct DOSButtonStyle: ButtonStyle {
    enum Variant {
        case primary
        case ghost
    }

    var variant: Variant = .primary

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(DOSTypography.button)
            .foregroundColor(variant == .primary ? AmberTheme.dosBlack : AmberTheme.amber)
            .padding(.horizontal, DOSSpacing.md)
            .padding(.vertical, DOSSpacing.xs)
            .background(
                variant == .primary
                    ? (configuration.isPressed ? AmberTheme.amberPressed : AmberTheme.amber)
                    : (configuration.isPressed ? AmberTheme.amber.opacity(0.1) : Color.clear)
            )
            .overlay(Rectangle().stroke(AmberTheme.amber, lineWidth: 1))
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
    }
}

#if DEBUG
struct DOSButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: DOSSpacing.lg) {
            Button("CONNECT SENSOR") {}
                .buttonStyle(DOSButtonStyle(variant: .primary))

            Button("DISCONNECT") {}
                .buttonStyle(DOSButtonStyle(variant: .ghost))

            Button("PAIR DEVICE") {}
                .buttonStyle(DOSButtonStyle(variant: .primary))
                .disabled(true)
        }
        .padding()
        .background(AmberTheme.dosBlack)
        .preferredColorScheme(.dark)
    }
}
#endif
