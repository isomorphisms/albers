# Peter Donahue beside Josef Albers

## The obvious connection

Josef Albers and Peter Donahue both distrust a color theory that begins by handing the student a supposedly authoritative wheel and a list of harmony rules.

The Albers Foundation summarizes Albers's approach as an **experimental way of studying color**: begin with what colors do in context, because color continually deceives perception. His course replaced the search for an inherent order with specific visual problems — make one color look like two, make different colors look alike, create apparent transparency, study afterimages, and so on.

Donahue reaches a related conclusion from a twenty-first-century direction. He often starts by testing the old diagrams against paint, spectra, perception, modern color spaces, and their own history. If the inherited wheel predicts badly, he changes the map.

These are compatible but not identical projects.

## Albers: perception first

Useful Foundation pages:

- Interaction of Color: https://www.albersfoundation.org/alberses/teaching/interaction-of-color
- Teaching: https://www.albersfoundation.org/alberses/teaching
- Workshops: https://www.albersfoundation.org/learning/workshops

Albers's color course is deliberately phenomenological. The student does the exercise before receiving a complete explanatory theory. The objective is to train discrimination and attention: **what do I actually see under these conditions?**

The Foundation's surviving student work includes Color-aid paper studies such as:

- transparency / film color;
- make one color look like two.

That is important for this repository. The controlled paper color is not incidental: it lets the student manipulate area, adjacency, quantity, and placement without every exercise becoming a lesson in pigment formulation and brush handling.

## Donahue: perception plus mechanism plus genealogy

Donahue keeps the perceptual surprise but usually wants to continue asking:

- What spectral distribution produced it?
- What does the visual system normalize or compare?
- Which dimension is changing: hue, lightness, chroma, saturation, brightness?
- Does the effect survive a change of medium?
- What historical diagram taught us to expect otherwise?
- Can a modern color-space visualization make the relation easier to navigate?

This makes Donahue useful as a **second pass after an Albers exercise**.

Do the Albers experiment first. Then ask Donahue-style questions about mechanism and representation.

## One color looks like two

Albers's classic exercise changes the surround while holding a central paper color physically constant. The student's task is to make the same physical color appear different.

Donahue's lightness/brightness cube belongs in the same family:

- https://www.youtube.com/shorts/5qbtjJe1V2o

He changes illumination/context cues around a painted patch and makes it appear to shift category toward something almost self-luminous. The vocabulary is more explicitly perception-science-oriented, but the pedagogical move is recognizably Albersian: **hold something constant, manipulate context, observe a changed appearance.**

## Color relativity versus color coordinates

A computational project is tempted to say:

> This patch is RGB `(r,g,b)`, therefore we know its color.

Albers is the reason that statement is insufficient. The coordinate specifies a device stimulus only after assumptions about encoding, display, white point, adaptation, environment, and calibration. It does not specify the complete appearance of the patch in context.

Donahue reinforces this with modern vocabulary:

- hue is not the whole color;
- saturation and chroma are not synonyms;
- lightness and brightness are not interchangeable;
- gamut boundaries are irregular;
- the same paint can move perceptually with illumination and surround.

His interactive saturation/chroma demonstration is useful here:

- https://petertdonahue.com/Saturation-vs-Chroma.html

## Why Donahue's attack on color wheels is Albers-adjacent

The Albers Foundation notes that Albers thought the conventional study of color wheels and globes had little practical value as the **beginning** of artist training. His course began instead with direct interaction.

Donahue's critique is more aggressive because he also audits the wheels historically and scientifically. But the shared objection is clear:

> A diagram can become a substitute for seeing.

This repository should therefore avoid treating a computational color model as the new authoritative wheel. A model is useful insofar as it predicts or explains a defined task.

## Where Donahue goes beyond Albers's pedagogical target

### Physical pigment prediction

Albers often used colored paper specifically to isolate perceptual interaction from paint mixing. Donahue spends a great deal of time on the mess Albers can bracket away:

- pigment spectra;
- tinting strength;
- nonlinear mixture paths;
- CMY versus RYB;
- warm/cool palette shifts;
- opacity/transparency;
- historical material palettes.

See [`painting-and-mixing.md`](painting-and-mixing.md).

### Modern color appearance spaces

Donahue uses CIE-derived models, CIECAM02, OKLCH, Munsell, OSA-UCS, and other systems as *tools* while remaining skeptical that one 2D wheel can solve every problem.

Albers's exercises predate these ordinary digital workflows and intentionally do not need them.

### Historical genealogy

Donahue asks who made the diagram, what pigments/printing process it assumed, who popularized it, and why it disappeared. That is a separate historical layer from Albers's classroom phenomenology.

## The directly Albers-related Donahue video

A Color Nerd upload is indexed around **Wojciech Fangor, Color-Aid, and the legacy of Josef Albers**:

- https://www.youtube.com/watch?v=sb60nHQ--fI

This should be treated as a priority source for the repository. At the time these notes were created, a reliable searchable transcript was not available, so I have **not** invented a detailed summary of Donahue's claims about Albers.

Once the transcript is recoverable, extract at least:

1. what Donahue says Color-Aid contributed to Albers-style pedagogy;
2. how he characterizes Albers's idea of interaction/relativity;
3. what he thinks Fangor inherits or changes;
4. whether he criticizes any Albers-era explanation in light of modern color science;
5. whether he distinguishes physical sample fidelity from the perceptual lesson.

## The cheap-edition / digital-reproduction problem

This is a crucial distinction for the larger Albers project.

A digital scan or inexpensive printed edition can preserve the **layout of an exercise** while failing to preserve the **stimuli** closely enough for the intended gestalt. Ink gamut, paper, screening, color management, aging, scan profiles, display calibration, and surrounding illumination can all move the colors.

Neither Albers nor Donahue gives us permission to treat arbitrary RGB values sampled from a low-quality reproduction as ground truth.

For computational work, record provenance separately:

- original physical Color-aid/sample, if measured;
- authorized high-quality reproduction;
- ordinary book reproduction;
- scan/photo of a reproduction;
- screen capture;
- inferred/reconstructed RGB.

A reconstruction can still be valuable if the goal is to reproduce **the relation or illusion**, but it should not be labeled as the exact historical color unless the measurement chain justifies that claim.

## A productive combined workflow

For each important Albers plate or exercise:

1. **State the perceptual task** in Albers's terms.
2. **Preserve provenance** of every color sample.
3. **Recreate the interaction** with the best available stimuli.
4. **Vary the colors computationally** to find a family of configurations producing the same effect.
5. **Describe the variation** in modern perceptual coordinates.
6. **Use Donahue-style physical reasoning** only when the medium/pigment question is relevant.
7. **Do not confuse explanation with exercise.** A successful model should deepen what is seen, not replace looking.

That seems the strongest reason to keep a Color Nerd branch next to the Albers material.
