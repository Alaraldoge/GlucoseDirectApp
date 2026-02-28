# Design System

## Design Philosophy

EatThisDie embraces a nostalgic amber CGA monitor aesthetic reminiscent of DOS-era computing, creating a unique and memorable visual identity that stands apart from typical clinical health app designs.

## Color Palette

### Primary Colors

#### Amber CGA (#ffbf00)
- **Usage**: Primary text color, accent elements, highlights
- **Inspiration**: Classic amber CRT monitor glow
- **Application**:
  - Main text and labels
  - Data values (glucose readings, carb counts)
  - Interactive elements and buttons
  - Focus states and selections

#### Supporting Colors
- **Background**: Deep black (#000000) or very dark gray (#0c0c0c)
- **Secondary Text**: Dimmed amber (#cc9900) for less important information
- **Success**: Bright green (#00ff00) - classic CGA green
- **Warning/Alert**: Bright red (#ff0000) - classic CGA red
- **Disabled**: Muted amber (#7f5f00)

### Usage Guidelines

#### Text Hierarchy
- **Primary Text**: #ffbf00 (Full amber)
- **Secondary Text**: #cc9900 (Dimmed amber)
- **Placeholder Text**: #7f5f00 (Muted amber)
- **Disabled Text**: #4c3800 (Very muted amber)

#### Interactive Elements
- **Default State**: #ffbf00 text on dark background
- **Hover/Focus**: Increased glow effect or slight brightness boost
- **Pressed**: Slightly dimmed amber (#e6ac00)
- **Disabled**: #7f5f00 with reduced opacity

## Typography

### Font Recommendations
1. **Primary**: SF Mono (iOS system monospace) - maintains Apple ecosystem consistency
2. **Alternative**: Menlo - fallback monospace font
3. **Body Text**: SF Pro (when monospace isn't appropriate)

### Characteristics
- Prefer monospace fonts to enhance the retro terminal aesthetic
- Clean, readable fonts that work well with amber coloring
- Maintain Apple's accessibility and dynamic type support

## Visual Effects

### Amber Glow
- Subtle shadow effects to simulate CRT monitor glow
- Text shadow: `0px 0px 8px rgba(255, 191, 0, 0.6)`
- Input field focus glow for enhanced interaction feedback

### Contrast & Accessibility
- Ensure proper contrast ratios for accessibility compliance
- Amber on black provides excellent readability
- Support for high contrast mode and dynamic type
- Alternative color schemes for users with visual sensitivities

## UI Components Style

### Buttons
- Amber text on transparent/dark background
- Subtle amber border for outlined buttons
- Glow effect on interaction

### Input Fields
- Dark background with amber text
- Amber cursor and selection highlighting
- Subtle amber border that glows on focus

### Data Display
- Amber text for all numerical values
- Monospace formatting for data alignment
- Grid layouts reminiscent of terminal interfaces

### Navigation
- Amber highlights for active/selected states
- Dark backgrounds throughout
- Minimal, clean lines

## Implementation Notes

### SwiftUI Color Implementation
```swift
extension Color {
    static let amberCGA = Color(red: 1.0, green: 0.75, blue: 0.0) // #ffbf00
    static let amberDimmed = Color(red: 0.8, green: 0.6, blue: 0.0) // #cc9900
    static let amberMuted = Color(red: 0.5, green: 0.375, blue: 0.0) // #7f5f00
}
```

### Dark Mode Considerations
- The amber-on-black theme works naturally with iOS dark mode
- Light mode alternative: amber accents on light backgrounds with sufficient contrast
- Respect user's system appearance preferences while maintaining amber identity

## Brand Identity

### Personality
- Nostalgic and unique
- Technical and precise
- Friendly but not clinical
- Memorable and distinctive

### Differentiation
- Stands out from typical blue/green health app color schemes
- Appeals to users who appreciate retro computing aesthetics
- Creates emotional connection through nostalgia
- Suggests precision and attention to detail

This design system creates a distinctive visual identity while maintaining excellent usability and accessibility standards.