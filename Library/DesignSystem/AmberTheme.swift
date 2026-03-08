//
//  AmberTheme.swift
//  DOSBTS
//
//  eiDotter CGA Amber Design System - iOS Token Mapping
//  Source: https://github.com/CinimoDY/eiDotter
//

import SwiftUI

/// eiDotter CGA Amber Theme - Token-aligned color definitions
public enum AmberTheme {

    // MARK: - Primary Amber Colors (eiDotter tokens)

    /// --color-cga-amber: #ffb000 - P3 phosphor amber (602nm)
    public static let amber = Color(red: 1.0, green: 176.0 / 255.0, blue: 0)

    /// --color-cga-amber-dim: #9a5700 - Secondary text, dimmed states (18pt+ only)
    public static let amberDark = Color(red: 154.0 / 255.0, green: 87.0 / 255.0, blue: 0)

    /// --color-cga-amber-bright: #fdca9f - Highlights, focus states
    public static let amberLight = Color(red: 253.0 / 255.0, green: 202.0 / 255.0, blue: 159.0 / 255.0)

    /// Pressed button state: #CC8C00
    public static let amberPressed = Color(red: 204.0 / 255.0, green: 140.0 / 255.0, blue: 0)

    /// --color-cga-dark-gray: #555555 - Disabled states, muted
    public static let amberMuted = Color(red: 85.0 / 255.0, green: 85.0 / 255.0, blue: 85.0 / 255.0)

    // MARK: - CGA 16-Color Palette (eiDotter tokens)

    /// --color-cga-bright-green / --status-success: #55ff55
    public static let cgaGreen = Color(red: 85.0 / 255.0, green: 1.0, blue: 85.0 / 255.0)

    /// --color-cga-bright-cyan / --status-info: #55ffff
    public static let cgaCyan = Color(red: 85.0 / 255.0, green: 1.0, blue: 1.0)

    /// --color-cga-bright-red / --status-error: #ff5555
    public static let cgaRed = Color(red: 1.0, green: 85.0 / 255.0, blue: 85.0 / 255.0)

    /// --color-cga-bright-magenta: #ff55ff
    public static let cgaMagenta = Color(red: 1.0, green: 85.0 / 255.0, blue: 1.0)

    /// --color-cga-yellow / --status-warning: #ffff55
    public static let cgaYellow = Color(red: 1.0, green: 1.0, blue: 85.0 / 255.0)

    /// --color-cga-brown: #aa5500
    public static let cgaBrown = Color(red: 170.0 / 255.0, green: 85.0 / 255.0, blue: 0)

    /// --color-cga-light-gray: #aaaaaa
    public static let cgaLightGray = Color(red: 170.0 / 255.0, green: 170.0 / 255.0, blue: 170.0 / 255.0)

    // MARK: - DOS Terminal Background Colors

    /// --color-cga-black: #000000
    public static let dosBlack = Color(red: 0, green: 0, blue: 0)

    /// Warm dark gray for card/surface backgrounds: #594F47
    public static let dosGray = Color(red: 89.0 / 255.0, green: 79.0 / 255.0, blue: 71.0 / 255.0)

    /// Warm dark gray for borders: #594F47
    public static let dosBorder = Color(red: 89.0 / 255.0, green: 79.0 / 255.0, blue: 71.0 / 255.0)

    /// --color-cga-light-gray: #aaaaaa
    public static let dosLightGray = Color(red: 170.0 / 255.0, green: 170.0 / 255.0, blue: 170.0 / 255.0)

    /// Warm near-black for card backgrounds: #1B1917
    public static let cardBackground = Color(red: 27.0 / 255.0, green: 25.0 / 255.0, blue: 23.0 / 255.0)

    // MARK: - Semantic Color Mapping

    public static let success = cgaGreen
    public static let warning = cgaYellow
    public static let error = cgaRed
    public static let info = cgaCyan

    // MARK: - Health Data Specific Colors

    public static let glucoseHigh = cgaRed
    public static let glucoseNormal = amber
    public static let glucoseLow = cgaGreen
    public static let glucoseTarget = amberLight

    // MARK: - Dynamic Color Support

    public static func textColor(for contrast: ColorSchemeContrast) -> Color {
        switch contrast {
        case .increased:
            return amberLight
        default:
            return amber
        }
    }

    public static func backgroundColor(for contrast: ColorSchemeContrast) -> Color {
        switch contrast {
        case .increased:
            return Color.black
        default:
            return dosBlack
        }
    }
}

// MARK: - Hex Color Initializer

extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
