# How Our Eyes Turn Light into Color

- Video: https://www.youtube.com/watch?v=u_tQ4UkIPfU
- Video ID: `u_tQ4UkIPfU`
- Date: 2025-02-09
- Length: about 5:46
- Creator: Peter T. Donahue / Color Nerd
- Status: **substantial-note**

## Demonstration

Donahue builds a deliberately coarse spectral model on graph paper. Different letters stand for different wavelength bands. Bands outside the visible range are discarded, then a hypothetical colored object is represented by removing some bands and retaining others. Counting what remains produces a rough spectral-reflectance profile.

He then applies three overlapping cone-sensitivity profiles to that spectrum. For each cone class, the spectral contributions are weighted and summed. The result is no longer a detailed spectrum: it is three aggregate response values.

## Main point

The visual system does not retain a wavelength-by-wavelength inventory. Each cone class reports its total stimulation across the range to which it is sensitive. Color appearance therefore depends on the **pattern of responses among cone classes**, not on wavelengths carrying intrinsic color labels.

This immediately motivates several phenomena:

- two different spectra can collapse to the same three cone responses: metamerism;
- mixtures of light or pigments matter because they alter the spectrum and therefore the response ratios;
- assigning an intrinsic color to one wavelength is a shorthand for the response that wavelength tends to produce in a normal trichromatic observer, not a property carried by the wavelength itself.

Donahue also introduces adaptation qualitatively: small spectral imbalances can be normalized by the visual system, while larger structured imbalances become conspicuous as color.

## Albers connection

This is foundational for the repository. Two physically different stimuli can be perceptually equivalent before contextual interaction is even introduced. That means the future Albers model needs separate layers for spectrum, display/pigment stimulus, observer response, and contextual appearance.
