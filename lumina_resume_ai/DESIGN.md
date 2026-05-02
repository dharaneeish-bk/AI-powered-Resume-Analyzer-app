---
name: Lumina Resume AI
colors:
  surface: '#0d1515'
  surface-dim: '#0d1515'
  surface-bright: '#333b3b'
  surface-container-lowest: '#080f10'
  surface-container-low: '#151d1e'
  surface-container: '#192122'
  surface-container-high: '#232b2c'
  surface-container-highest: '#2e3637'
  on-surface: '#dce4e5'
  on-surface-variant: '#b9cacb'
  inverse-surface: '#dce4e5'
  inverse-on-surface: '#2a3233'
  outline: '#849495'
  outline-variant: '#3b494b'
  surface-tint: '#00dbe9'
  primary: '#dbfcff'
  on-primary: '#00363a'
  primary-container: '#00f0ff'
  on-primary-container: '#006970'
  inverse-primary: '#006970'
  secondary: '#e9b3ff'
  on-secondary: '#510074'
  secondary-container: '#7d01b1'
  on-secondary-container: '#e5a9ff'
  tertiary: '#edf7ff'
  on-tertiary: '#003548'
  tertiary-container: '#abe1ff'
  on-tertiary-container: '#006688'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#7df4ff'
  primary-fixed-dim: '#00dbe9'
  on-primary-fixed: '#002022'
  on-primary-fixed-variant: '#004f54'
  secondary-fixed: '#f6d9ff'
  secondary-fixed-dim: '#e9b3ff'
  on-secondary-fixed: '#310048'
  on-secondary-fixed-variant: '#7200a3'
  tertiary-fixed: '#c1e8ff'
  tertiary-fixed-dim: '#74d1ff'
  on-tertiary-fixed: '#001e2b'
  on-tertiary-fixed-variant: '#004d67'
  background: '#0d1515'
  on-background: '#dce4e5'
  surface-variant: '#2e3637'
typography:
  h1:
    fontFamily: Manrope
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  h2:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.3'
    letterSpacing: -0.01em
  h3:
    fontFamily: Manrope
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.4'
    letterSpacing: '0'
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: '0'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: '0'
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1.0'
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 24px
  lg: 48px
  xl: 80px
  gutter: 24px
  margin: 32px
---

## Brand & Style

The design system is engineered for a premium, high-integrity AI platform that balances technical sophistication with an elite fintech aesthetic. The brand personality is authoritative yet visionary, positioning the resume analysis process as a data-driven journey toward professional advancement.

The design style centers on **Glassmorphism**, utilizing multi-layered translucency to create a sense of depth and focus. By layering frosted surfaces over deep, vibrant atmospheric gradients, the UI achieves a "spatial" quality that feels modern and high-end. The interface remains minimal and smooth, prioritizing breathing room and clarity to ensure the AI's complex insights are easily digestible.

## Colors

The palette is anchored in a deep, nocturnal foundation to allow the accent colors to resonate with a "glowing" effect.

- **Backgrounds:** Utilize a linear gradient from Deep Blue (`#0A0B1E`) to a muted Dark Purple (`#1A1231`) at a 135-degree angle.
- **Accents:** 
    - **Cyan (Primary):** Used for primary actions and critical AI "success" states.
    - **Purple (Secondary):** Used for branding elements, AI "processing" states, and decorative highlights.
    - **Light Blue (Tertiary):** Used for informative labels and secondary metrics.
- **Neutrals:** Greys are tinted with blue to maintain harmony with the dark theme, ranging from deep charcoal for secondary surfaces to pure white for high-contrast headers.

## Typography

This design system utilizes a dual-font strategy to balance character with utility. 

**Manrope** is the headline face, chosen for its modern, geometric construction and premium "fintech" feel. It should be used for all primary headings to establish a confident tone. 

**Inter** serves as the workhorse for body copy, data points, and labels. Its neutral, systematic nature ensures high legibility within the semi-transparent glass cards and complex data visualizations.

## Layout & Spacing

The layout follows a **Fluid Grid** model with a maximum content width of 1440px. A 12-column system is used for dashboard layouts, while a single-column centered layout is preferred for the initial resume upload experience to minimize distraction.

Spacing is generous to maintain the "Elegant" brand pillar. Vertical rhythm is established using 24px and 48px increments to separate major sections, ensuring that glass cards have enough "air" to appear as if they are floating.

## Elevation & Depth

Depth is the primary communicator of hierarchy in this design system. It is achieved through three layers:

1.  **The Atmosphere (Level 0):** The base background gradient with subtle, large-scale blurs (200px+) of Cyan and Purple to create "light leaks."
2.  **The Glass (Level 1):** Main content cards using a background blur of 20px to 40px. They feature a 1px inner border (stroke) with a white-to-transparent gradient (opacity 10%) to simulate a glass edge.
3.  **Floating Elements (Level 2):** Tooltips, dropdowns, and modals. These use a darker glass tint and more pronounced, soft-diffused shadows with a 10% Cyan or Purple tint to suggest they are closer to the user.

## Shapes

The shape language is organic yet controlled. Large radii (24px) are applied to primary containers to soften the technical feel of the AI data. Smaller UI elements like buttons and inputs use a 12px radius to maintain a sophisticated, precise appearance without feeling "bubbly."

All "glass" cards must have a consistent corner radius of 24px to reinforce the premium, unified aesthetic.

## Components

- **Buttons:** 
    - *Primary:* Solid Cyan gradient with black text for maximum contrast. 
    - *Secondary:* Ghost style with a thin Cyan border and subtle hover glow.
- **Glass Cards:** The core component. Must include a `backdrop-filter: blur(20px)`, a semi-transparent background color, and a 1px top-left weighted highlight border.
- **Inputs:** Darker than the card background (filled style) with a 1px border that illuminates in Cyan when focused.
- **AI Score Gauge:** A circular progress indicator using the Primary Cyan-to-Secondary Purple gradient to visualize resume strength.
- **Chips/Badges:** Used for "Keywords Found" or "Skills." These should be pill-shaped with a low-opacity Purple fill and high-contrast text.
- **Data Visualizations:** Minimalist line graphs or bar charts using the accent colors, featuring soft glows on data points.