# Saturation vs. Chroma

- Video: https://www.youtube.com/shorts/xhYNtMvWbZ4
- Video ID: `xhYNtMvWbZ4`
- Creator: Peter T. Donahue / Color Nerd
- Companion visualization: https://petertdonahue.com/Saturation-vs-Chroma.html
- Status: **substantial-note**
- Transcript status: a dependable full transcript has not yet been preserved here; the conceptual sequence below is reconstructed from the existing video note and Donahue's first-party interactive companion.

## Core distinction

Donahue's point is that **saturation and chroma are not synonyms** even though both are ordinary-language ways of talking about how colorful something looks.

He treats them as different geometric quantities on a hue plane:

- **saturation** is relative — colorfulness judged in proportion to brightness;
- **chroma** is closer to an absolute displacement from neutral at comparable lightness.

That means two samples can have the same chroma but different saturation, or the same saturation but different chroma.

## Geometry he is trying to make visible

The useful part of the explanation is not merely vocabulary. Donahue wants the viewer to see that the two definitions produce different families of curves.

### Equal saturation

Because saturation is a ratio involving brightness, equal-saturation paths contract as lightness approaches black. In a chroma-on-the-horizontal-axis hue plane, the equal-saturation lines therefore fan inward and converge toward the black point.

### Equal chroma

In an OKLCH-style hue plane where horizontal displacement is chroma, equal-chroma lines remain at constant horizontal displacement from the achromatic axis. They do not converge at black; they simply terminate when they hit the available gamut boundary.

## Why ordinary software can confuse the issue

Donahue objects to treating a generic software **Saturation** slider as if it were automatically a perceptually uniform measure. Many familiar rectangular color pickers present mathematically convenient coordinates whose equal numeric steps are not equal perceptual steps.

The consequence is pedagogical as well as practical: a user can come away thinking "saturation" is simply the horizontal distance across a rectangle, when that rectangle may be encoding HSL/HSV-style coordinates rather than a perceptually organized hue plane.

## Systems named

### DIN 6164

Donahue uses DIN 6164 for the saturation visualization because it attempts perceptually calibrated saturation increments rather than the simple saturation coordinate from HSL.

The companion visualization describes its plotted saturation as an absolute DIN-style chromaticity-distance construction in CIE xy, with equal DIN steps intended as equal perceptual increments.

### OKLCH / OKLab

He uses OKLCH chroma for the chroma side of the comparison. Chroma is represented as distance from the achromatic axis in OKLab-derived coordinates.

This is important to the visualization because the coordinate itself makes constant-chroma lines geometrically simple while allowing the actual sRGB gamut boundary to stay irregular.

## Gamut dependence

Donahue emphasizes that the available shape changes with hue. A green hue plane can extend much farther in chroma than a violet one inside sRGB. Therefore the relation among saturation, chroma, lightness, and the display gamut cannot be understood from one generic rectangular picker.

## Practical experiment in the companion visualization

The interactive lets the user:

- switch the horizontal coordinate between saturation and chroma;
- turn saturation, chroma, and lightness iso-lines on and off;
- move through hue and watch the gamut change shape;
- select a point and inspect DIN saturation, OKLCH chroma, OKLCH hue/lightness, and sRGB representation together.

The point is to make the distinction spatial rather than verbal.

## Connection to Albers

This matters directly to the Albers work because we should not treat a numeric slider or even one approximately perceptual coordinate system as the phenomenon itself.

For our experiments:

1. keep the physical/display sample explicit;
2. keep its chosen color-space coordinates explicit;
3. distinguish constant-chroma perturbations from constant-saturation perturbations;
4. do not assume equal coordinate increments imply equal perceived changes;
5. when surrounding colors are introduced, treat contextual appearance as another layer rather than silently folding it into the coordinate definition.

The current CIELAB shell in the Albers branch explores roughly equal `Delta E*ab` radius. Donahue's distinction suggests another useful family of experiments later: compare nominally equal-chroma and equal-saturation paths under the same surrounding context and ask whether the perceptual interaction behaves differently.

## What remains to recover

- exact spoken transcript and ordering;
- any examples or gestures in the short that are not represented by the companion visualization;
- exact wording of his criticism of ordinary digital pickers;
- whether DIN 6164 and OKLCH are both named in the spoken short or one is supplied only by the companion page.
