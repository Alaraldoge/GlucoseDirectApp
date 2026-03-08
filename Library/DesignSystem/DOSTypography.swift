//
//  DOSTypography.swift
//  DOSBTS
//
//  DOS-Inspired Typography System
//  Monospace fonts for retro terminal aesthetic
//

import SwiftUI

/// DOS-inspired typography system using monospace fonts for retro terminal aesthetic
public enum DOSTypography {

    // MARK: - Display Sizes (Headers)

    /// Large display (34pt) - Main screen titles
    public static let displayLarge = Font.system(size: 34, weight: .bold, design: .monospaced)

    /// Medium display (28pt) - Section headers
    public static let displayMedium = Font.system(size: 28, weight: .bold, design: .monospaced)

    /// Small display (22pt) - Subsection headers
    public static let displaySmall = Font.system(size: 22, weight: .semibold, design: .monospaced)

    // MARK: - Body Text

    /// Large body (20pt) - Emphasized content
    public static let bodyLarge = Font.system(size: 20, weight: .regular, design: .monospaced)

    /// Regular body (17pt) - Standard text
    public static let body = Font.system(size: 17, weight: .regular, design: .monospaced)

    /// Small body (15pt) - Secondary text, timestamps, metadata
    public static let bodySmall = Font.system(size: 15, weight: .regular, design: .monospaced)

    // MARK: - Data Display (Tabular Numbers)

    /// Glucose hero (60pt) - The main glucose reading
    public static let glucoseHero = Font.system(size: 60, weight: .bold, design: .monospaced)
        .monospacedDigit()

    /// Large data (24pt) - Primary metrics
    public static let dataLarge = Font.system(size: 24, weight: .semibold, design: .monospaced)
        .monospacedDigit()

    /// Regular data (17pt) - Standard metrics
    public static let data = Font.system(size: 17, weight: .regular, design: .monospaced)
        .monospacedDigit()

    /// Small data (15pt) - Supporting metrics
    public static let dataSmall = Font.system(size: 15, weight: .regular, design: .monospaced)
        .monospacedDigit()

    // MARK: - Labels & Captions

    /// Caption (12pt) - Small descriptive text, chart axes
    public static let caption = Font.system(size: 12, weight: .regular, design: .monospaced)

    /// Caption emphasized (12pt bold) - Important small text
    public static let captionEmphasized = Font.system(size: 12, weight: .bold, design: .monospaced)

    // MARK: - UI Elements

    /// Button text (17pt) - Interactive elements
    public static let button = Font.system(size: 17, weight: .semibold, design: .monospaced)

    /// Button small (15pt) - Secondary buttons
    public static let buttonSmall = Font.system(size: 15, weight: .medium, design: .monospaced)

    /// Tab bar (10pt) - Navigation labels
    public static let tabBar = Font.system(size: 10, weight: .medium, design: .monospaced)

    // MARK: - Dynamic Type Support

    /// Returns a dynamically scaled font based on user's accessibility settings
    public static func dynamicFont(
        for style: Font.TextStyle,
        design: Font.Design = .monospaced
    ) -> Font {
        return .system(style, design: design)
    }

    // MARK: - Weight Variants

    /// Creates a font with custom weight
    public static func mono(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return Font.system(size: size, weight: weight, design: .monospaced)
    }

    // MARK: - Letter Spacing

    /// Default body letter spacing (0 for readability)
    public static let bodyLetterSpacing: CGFloat = 0

    /// Wide letter spacing for uppercase headers
    public static let wideLetterSpacing: CGFloat = 1.5

    /// Tight letter spacing for compact displays
    public static let tightLetterSpacing: CGFloat = -0.3
}

// MARK: - View Modifiers

extension View {

    /// Applies DOS typography style with amber color
    public func dosText(
        font: Font,
        color: Color = AmberTheme.amber
    ) -> some View {
        self
            .font(font)
            .foregroundColor(color)
    }

    /// Applies DOS data display styling with multi-layer phosphor glow
    public func dosData(font: Font = DOSTypography.data) -> some View {
        self
            .font(font)
            .foregroundColor(AmberTheme.amber)
            .shadow(color: AmberTheme.amber.opacity(0.4), radius: 1, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.15), radius: 4, x: 0, y: 0)
    }

    /// Applies DOS terminal-style header with multi-layer phosphor glow
    public func dosHeader(level: Int = 1) -> some View {
        let font: Font
        switch level {
        case 1:
            font = DOSTypography.displayLarge
        case 2:
            font = DOSTypography.displayMedium
        case 3:
            font = DOSTypography.displaySmall
        default:
            font = DOSTypography.displayMedium
        }

        return self
            .font(font)
            .foregroundColor(AmberTheme.amber)
            .textCase(.uppercase)
            .shadow(color: AmberTheme.amber.opacity(0.8), radius: 1, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.4), radius: 6, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.15), radius: 16, x: 0, y: 0)
    }

    // MARK: - Glow Modifiers

    /// Small phosphor glow for data values, interactive elements
    public func dosGlowSmall() -> some View {
        self
            .shadow(color: AmberTheme.amber.opacity(0.4), radius: 1, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.15), radius: 4, x: 0, y: 0)
    }

    /// Large phosphor glow for hero glucose, headers
    public func dosGlowLarge() -> some View {
        self
            .shadow(color: AmberTheme.amber.opacity(0.8), radius: 1, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.4), radius: 6, x: 0, y: 0)
            .shadow(color: AmberTheme.amber.opacity(0.15), radius: 16, x: 0, y: 0)
    }
}

// MARK: - Preview Helper

#if DEBUG
struct DOSTypography_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Headers
                Group {
                    Text("DISPLAY LARGE")
                        .dosHeader(level: 1)

                    Text("Display Medium")
                        .dosHeader(level: 2)

                    Text("Display Small")
                        .dosHeader(level: 3)
                }

                Divider().background(AmberTheme.dosBorder)

                // Body text
                Group {
                    Text("Body Large - Regular reading text")
                        .dosText(font: DOSTypography.bodyLarge)

                    Text("Body - Standard text for content")
                        .dosText(font: DOSTypography.body)

                    Text("Body Small - Metadata, timestamps")
                        .dosText(font: DOSTypography.bodySmall)
                }

                Divider().background(AmberTheme.dosBorder)

                // Data displays
                Group {
                    Text("125")
                        .dosData(font: DOSTypography.glucoseHero)
                        .dosGlowLarge()

                    Text("45.8g CARBS")
                        .dosData(font: DOSTypography.dataLarge)

                    Text("120 mg/dL")
                        .dosData()
                }

                Divider().background(AmberTheme.dosBorder)

                // Labels and captions
                Group {
                    Text("CAPTION TEXT")
                        .dosText(font: DOSTypography.caption, color: AmberTheme.amberDark)

                    Text("CAPTION EMPHASIZED")
                        .dosText(font: DOSTypography.captionEmphasized, color: AmberTheme.amberDark)
                }

                Divider().background(AmberTheme.dosBorder)

                // Terminal style
                Text("GLUCOSE MONITOR")
                    .dosHeader(level: 1)
            }
            .padding()
        }
        .background(AmberTheme.dosBlack)
        .preferredColorScheme(.dark)
    }
}
#endif
