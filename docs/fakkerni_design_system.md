# Fakkerni Design System

Version 1.0

A complete visual language for a voice-first reminder system - calm, precise, and built for every user.

## Foundations

### Color tokens

Three purpose-built ramps anchored in cool, restful blues. The waveform signature (left-edge bars on components) uses the primary ramp to connect every component back to the voice-capture metaphor. All stops pass WCAG AA against white backgrounds at the 600 level and above.

**Primary - light blue**
Interaction, links, actions, waveform bars.

**Secondary - blue-violet**
Hierarchy support, active states.

**Accent - soft purple**
Decorative, recurring reminders, special states.

**Neutral - cool gray**
Text, surfaces, borders - has a slight blue cast.

**Semantic fixed-purpose only**
Never use as decoration.

- Success: bg #EDFAF5, text #1A9E6A
- Warning: bg #FFF8EB, text #D48A0C
- Danger: bg #FEF1F1, text #C84040

Token naming convention:
Tokens follow the pattern color.{role}.{stop}. Usage: 50-100 for backgrounds, 200-300 for borders and subtle fills, 400-500 for interactive elements (default state), 600-700 for pressed/active states, 800-900 for text on light fills. The neutral ramp has a deliberate +6 blue hue offset so it harmonises with the primary palette rather than feeling warm or warm-gray.

## Typography

Cairo as the display voice - geometric, authoritative, Arabic-native. IBM Plex Sans Arabic as the reading voice - engineered for clarity at small sizes, with excellent Arabic numeral support. The pairing gives warmth and precision without either font feeling out of place in an Arabic interface.

**Cairo - display, headings, reminder titles**

- Display: 32 / 700, -0.02em
- Heading 1: 24 / 700, -0.01em
- Heading 2: 20 / 600
- Title: 17 / 600
- Subtitle: 15 / 600

**IBM Plex Sans Arabic - body, labels, metadata**

- Body Regular: 16 / 400, 1.65 lh
- Body Small: 14 / 400
- Label: 13 / 500
- Caption: 11 / 500, 0.06em tracking
- Micro: 12 / 400

## Spacing system

Based on a 4px base unit. Spacing is applied consistently - the intervals are not purely uniform but follow the rhythm 4, 8, 12, 16, 20, 24, 32, 40, 48, reflecting the visual intervals of a voice waveform rather than a mechanical grid.

- 4px
- 8px
- 12px
- 16px
- 20px
- 24px
- 32px
- 40px
- 48px

## Elevation, radius and shadow

Five elevation levels with shadows based on the neutral-900 color rather than pure black for warmth. Shadows use two layers: a large soft ambient and a tight sharp definition layer, giving depth without harshness.

**Elevation**

- Level 0: no elevation
- Level 1: 0 1px 2px
- Level 2: 0 2px 8px
- Level 3: 0 4px 16px
- Level 4: 0 8px 32px

**Radius scale**

- xs: 8px
- sm: 12px
- md: 16px
- lg: 20px
- xl: 28px
- pill: 100px

## Components

### Button system

Five button variants. Primary uses the pill radius to distinguish it from secondary - a deliberate hierarchy signal. Minimum touch target 48px height on all interactive controls.

**Variants**

- Primary: height 52px, bg primary-500, pill radius, Cairo 600 15px, white text, shadow-sm
- Secondary: height 52px, bg primary-50, pill radius, border 1.5px primary-100, color primary-700
- Ghost: height 52px, transparent bg, pill radius, border 1.5px primary-200, color primary-600
- Danger: height 52px, bg danger-bg, radius-sm, border 1.5px #F5CECE, color danger
- Small: height 40px, same radius rules, font size 13px
- Icon-only: 48x48px circular, focus ring 0 0 0 3px primary-200

### Reminder cards

The reminder card is the primary information unit. The signature left-bar (4px wide) communicates priority and state at a glance - the waveform metaphor in its most reduced form. Cards at rest sit at elevation 2. Swiped state reveals action surfaces beneath.

**States**

- Default
- Urgent
- Recurring
- Done

**Card specs**

- Height: min 72px
- Radius: 20px
- Shadow: level 2
- Left bar: 4px wide
- Checkbox: 26x26px circle, 2px border, 44x44px tap area
- Title: Cairo 15px/600
- Meta: IBM Plex 12px/400
- Swipe-left reveals snooze
- Swipe-right reveals edit
- Completed state: title strikethrough, opacity 0.7, bar neutral-300

### Timeline component

Used in the day view and reminder history. The dot states communicate time-relative status: done, active, upcoming, missed.

### Input fields

Used only in the edit screen. Three states: rest, focused, and error. Designed for large touch targets and high legibility - input height 52px minimum, font size 15px minimum.

### Notification card

The lock screen and heads-up notification. Uses elevation level 3. Large type ensures legibility without glasses. Two action buttons, full width, generous height.

### Overlay - recording surface

The voice capture overlay is the signature component. It uses a dark scrim over the background content. The modal card uses the xl radius (28px) to feel distinct from the underlying app. The pulse ring animates on a 2-second ease-out loop.

### Floating side trigger (FST)

The permanently visible entry point. Sits on the screen edge - 50% exposed, 50% hidden. Primary-500 background. The ghost track shows the drag affordance before the user touches it. On first launch only, a one-time animation pulses the FST to draw attention.

### App screen preview

The reminders list - the only screen in the app. Everything else (the overlay, notification, FST) is a system-level layer above it.

## Accessibility and elderly rules

Every rule below has a measurable specification. Rules without numbers are intentions, not requirements.

### Vision

- All text on surfaces: min 4.5:1 contrast (WCAG AA)
- Primary-500 on white: 4.78:1
- Neutral-600 on white: 5.74:1
- No information conveyed by color alone
- State bars paired with text label badge
- Elderly mode: 20sp minimum body text
- All icons accompanied by text label

### Motor

- All touch targets: 48x48dp minimum
- Checkboxes: 26dp circle, 44dp tap zone
- Buttons: 52dp height default
- FST drag: forgiving 30-60dp threshold
- No gestures requiring simultaneous fingers
- Swipe-to-delete: not exposed
- One-handed full support, either hand

### Hearing

- All audio states have visual equivalent
- Waveform animation = "I hear you" signal
- Notification sound is optional
- TTS notification readout in elderly mode
- Haptic feedback for all state changes
- Full functionality on muted device

### Cognitive

- Max 2 app screens total
- Errors in plain language, no jargon
- Every error has exactly 1 recovery action
- No auto-advancing screens
- Toast duration: 4s default, 6s elderly mode
- Destructive actions: inline confirm only
- Full RTL Arabic layout support

## Design System v1.0

Cairo + IBM Plex Sans Arabic
WCAG AA
Android
RTL ready
