# Peter Donahue on painting, pigments, and mixing

This file extracts the studio-practice side of Color Nerd. It is intentionally organized by **problems a painter faces**, not by upload chronology.

## 1. The paint tube is not a point on an ideal wheel

A recurring Donahue distinction is between:

- a perceived color;
- a coordinate in a color model;
- a named hue category;
- a physical paint made from one or more pigments.

Those are related but not interchangeable.

A tube called *cadmium red* has a spectral reflectance curve, opacity, tinting strength, undertone, and mixture behavior. A blue paint with the same rough screen hue as another blue can mix very differently because the pigments do not reflect and absorb the same wavelengths.

This is the practical reason he distrusts statements such as "red plus blue makes purple" unless the speaker specifies **which red and which blue**.

## 2. The familiar RYB triangle has a material problem

### Relevant videos

- RYB vs CMY: https://www.youtube.com/shorts/LfgswanxffM
- Science-based color wheel: https://www.youtube.com/watch?v=alrdClpGHvY
- Mixing Paint lecture: https://www.youtube.com/watch?v=jLSCbbID1ck
- Moses Harris: https://www.youtube.com/watch?v=bAIWcrBN6CY

Donahue's objection to RYB is not merely that printers use CMYK or screens use RGB. It is that a generic red, yellow, and blue are poor candidates for three ideal subtractive primaries.

A red already excludes much of the shorter-wavelength light that would be needed for a vivid violet. A cyan-ish blue and such a red can therefore leave very little reflected light when mixed, producing a dark dull result. Magenta is more useful on the red side of a subtractive palette because many magenta pigments preserve both long- and short-wavelength reflectance needed for vivid violets.

Likewise, a nominal red plus yellow does not guarantee an evenly intermediate orange. The starting spectra and tinting strengths determine the path.

## 3. Mixing paths are nonlinear

In the University of the Fraser Valley lecture Donahue demonstrates blue/yellow mixtures at several ratios. Equal changes in paint proportion do **not** produce equal changes in perceived hue.

This is one of his most important corrections to a flat wheel. A straight line drawn between two ideal swatches is at best a rough map. Real mixture paths can bend, compress, or spend a long time near one endpoint before visibly turning.

Reasons include:

- pigment-specific tinting strength;
- spectral overlap and cancellation;
- scattering and absorption in the paint layer;
- the nonlinear relation between physical stimulus and perceptual coordinates.

His later Color Disc work tries to represent this curvature pedagogically without asking beginners to solve Kubelka-Munk equations.

## 4. Tinting strength is not symmetry

If two pigments are mixed 1:1 by volume, there is no reason they should contribute equally to appearance.

In Donahue's demonstrations, blues can dominate a yellow surprisingly quickly. The correct general lesson is not "blue is always stronger than yellow" but **pigment strength is an empirical property of the specific paints**. A palette model that ignores this will mispredict proportions even if its hue geometry is otherwise sensible.

## 5. Why some purples die

### Relevant video

- Mixing Paint lecture: https://www.youtube.com/watch?v=jLSCbbID1ck

Donahue's cadmium-red + cobalt-blue example is a clean spectral lesson.

- The red pigment returns mostly longer wavelengths.
- The blue returns mostly shorter wavelengths.
- The mixture can strongly suppress the wavelengths each partner fails to return.
- The surviving reflected spectrum has too little energy / too little selective structure for a high-chroma purple.

A quinacridone magenta or a dedicated dioxazine violet behaves differently. This is a much better explanation than saying the painter used the "wrong kind of blue" without explaining why.

## 6. White does more than lighten

Adding titanium white changes multiple perceptual attributes at once.

In Donahue's examples:

- red becomes pink: lightness rises, chroma/saturation changes, and hue can shift;
- blue can shift toward cyan as it is tinted;
- the mixture reveals an undertone that may be hard to see in mass tone.

This matters for any attempt to reproduce Albers-like studies digitally. A naive operation such as "hold hue fixed and raise HSL lightness" is not generally equivalent to mixing a physical color with white paint.

## 7. Black does more than darken

The complementary example is black plus yellow producing olive/greenish mixtures rather than an abstract "dark yellow" along a fixed hue line.

Again: pigment mixing is not a slider in a rectangular UI. The spectral properties of the black and yellow interact, and perception changes with both lightness and chromatic content.

## 8. Chroma maxima are unequal

A conventional wheel often places twelve maximally vivid-looking wedges on one ring, implying equal available chroma. Real color gamuts are irregular.

Different hues reach their maximum chroma at different lightness levels and different distances from the neutral axis. This is obvious in Munsell-like solids and modern perceptual-gamut visualizations but hidden by a flat ideal wheel.

Relevant material:

- Chroma vs saturation: https://www.youtube.com/shorts/IlpD9DXiH-c
- Interactive: https://petertdonahue.com/Saturation-vs-Chroma.html
- Munsell video: https://www.youtube.com/watch?v=06ul1hBUjaE

## 9. Complements: visual opposition is not a guaranteed mixing recipe

There are several meanings of "complementary":

- two lights that add toward a chosen white;
- opponent perceptual directions;
- hues opposite on a historical wheel;
- two pigments that mix near neutral;
- two colors chosen for visual contrast.

Donahue's work is valuable because he keeps finding cases where art instruction silently swaps one meaning for another.

A pair can look strongly opposed yet fail to mix gray. Conversely, a pigment pair can neutralize because of its spectra without being geometrically opposite on an RYB wheel.

## 10. "Integrated mixing"

In *Everything TikTok Taught Me About Color Theory*, Donahue rejects an overly literal story in which paint mixing is simply the subtractive equivalent of RGB addition.

He cites David Briggs's description of real paint mixing as a compromise between subtractive behavior and additive averaging, and Harold Küppers's term **integrated mixing**. Kubelka-Munk theory is the rigorous physical reference point, but far too cumbersome for a beginner's visual rule.

His "octopus" diagrams are an attempt to visualize the resulting curved paths:

- mixtures around additive-primary regions can curve inward toward lower chroma;
- mixtures among subtractive-primary regions can follow very different outward/around-the-gamut paths;
- intermediate hues create enough complexity to destroy the fantasy of one universal straight-line mixing rule.

Lecture: https://www.youtube.com/watch?v=7dXXlyi__tA

## 11. Warm/cool is a palette transformation, not six labels

### Relevant videos

- Warm/cool ≠ hue: https://www.youtube.com/shorts/XmQ9O4efPrQ
- Is green warm or cool?: https://www.youtube.com/shorts/WQYLfwa2lAI
- Color Temperature = Spectral Bias: https://www.youtube.com/shorts/M3py_iSpuyA
- Warm Light, Cool Shadow: https://www.youtube.com/watch?v=_wRA-XvgFKo

Painter pedagogy often says "this is a warm blue" and "that is a cool blue" as if temperature were another coordinate attached to a paint chip.

Donahue's more useful picture is a **spectral/gamut bias**. Shift the available illumination or palette toward one end of the spectrum and different hues respond differently:

- warm-side colors may gain apparent chromatic strength;
- opposite-side colors may be pushed toward neutral;
- greens or purples may shift in hue and chroma together.

This is why he treats temperature as a structured transformation of a palette rather than a fourth perceptual axis alongside hue, lightness, and chroma.

## 12. His actual painter courses

### Color for Painters

https://drawingamerica.com/courses/peter-donahues-color-for-painters/

Uses artist-grade acrylics, color-filter exercises, paint mixing, and modern color diagrams. The course is intended for both realist and abstract painters.

### Color Temperature for Painters

https://drawingamerica.com/courses/peter-donahues-color-temperature-for-painters/

Demonstrated in oils. The materials list includes quinacridone magenta, cadmium red, lemon/bismuth yellow, green-gold, phthalo blue, cobalt teal/turquoise, black, and titanium white. Exercises use prepared palettes to study atmospheric perspective, golden-hour light, and multiple illuminants.

### Famous Palettes

https://drawingamerica.com/courses/famous-palettes-with-peter-donahue-caravaggio/

Four lecture/demo pairs:

1. Caravaggio;
2. Turner;
3. Mary Cassatt;
4. Munsell.

The course is a useful reminder that palette history is partly the history of available substances. A painter's gamut is constrained by chemistry, trade, cost, opacity, durability, and technique before it becomes an aesthetic "choice."

## 13. Computational consequence for this repository

If the Albers project eventually tries to model physical-paint examples computationally, RGB interpolation is not enough.

There are at least three distinct tasks:

1. **reproduce a printed/sample appearance** under specified viewing conditions;
2. **model perceptual relations** among displayed colors;
3. **predict physical pigment mixtures**.

Those require different models. Donahue's work is most useful when it prevents us from treating one representation as all three.
