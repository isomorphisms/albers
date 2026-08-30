# How Chroma and Saturation Are Different

- Video ID: `IlpD9DXiH-c`
- URL: https://www.youtube.com/shorts/IlpD9DXiH-c
- Date: 2023-03-29
- Source status: transcript-derived
- Archive status: full-note

## Claim ledger

1. Donahue starts from the problem that *chroma* and *saturation* are both often described informally as color intensity, even though they are different quantities.
2. He defines chroma relationally against a neutral of comparable lightness: colors farther from the neutral axis have more chroma.
3. He uses a sequence of greens to show that colors at different lightnesses can still have the same chroma.
4. He then separates saturation from that construction. Saturation concerns colorfulness relative to the color's own brightness rather than distance from an equal-lightness gray.
5. In the hue-plane picture, equal-chroma locations are organized by distance from the neutral axis, whereas equal-saturation locations fall along rays associated with the black point.
6. The practical point is that changing lightness can preserve one of these quantities while changing the other. Treating the words as synonyms loses real structure.

## Distinctions to retain

- **Chroma:** amount of colorfulness relative to a neutral at comparable lightness; geometrically modeled as distance from an achromatic axis in perceptual cylindrical spaces.
- **Saturation:** colorfulness relative to brightness; a proportional quantity rather than the same absolute displacement measured by chroma.
- Equal chroma does not imply equal saturation.
- Equal saturation does not imply equal chroma.

## Relation to the companion short

The later short [`xhYNtMvWbZ4`](xhYNtMvWbZ4.md) takes this same distinction and makes the geometry more explicit: different hue planes reach their available chroma at different lightnesses, and ordinary computer pickers often warp these perceptual relations for convenience.

## Technical qualification

Software terms such as HSV/HSL “saturation” are model-specific coordinates and should not automatically be identified with CIE saturation. Donahue's central distinction here is perceptual, not a claim that every software slider implements it.

## Albers relevance

This matters immediately for contextual experiments. If a surround changes the *appearance* of a fixed patch, we should record whether the apparent displacement is mostly in lightness, chroma, saturation, hue, or some combination. A single generic “intensity” coordinate would erase exactly the distinctions Albers exercises expose.
