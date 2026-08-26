# Jackson Pollock

Working folder for Pollock paintings and rights/provenance research for the Albers experiments.

Status checked: 2026-08-26.

## Why this needs per-work checking

Jackson Pollock died on 11 August 1956. In jurisdictions using a life-plus-70 term, his works generally remain protected through the end of 2026 and enter the public domain on 1 January 2027, subject to the law of the particular country.

The United States is different for works published before 1978. Publication date, copyright notice, registration, and renewal can matter. A Pollock work can therefore be public domain in the United States even while other Pollock works remain copyrighted.

For this repository, do not infer rights from the artist's death date alone, from the fact that a museum displays a zoomable image, or from an aggregator saying "public domain" without checking the underlying reason.

"Open source" is not usually the term used for paintings. The useful buckets here are public domain, CC0/openly licensed, copyrighted with permission, and unclear/conflicting.

## Strongest U.S. public-domain result so far

### Greyed Rainbow, 1953

Art Institute of Chicago, accession 1955.494.

The Art Institute's own copyright-law exhibition explicitly used *Greyed Rainbow* as an example of an artwork now in the United States public domain because the required renewal application was not filed after its publication in Bryan Robertson's 1960 *Jackson Pollock*.

Primary institutional rights research:
- https://archive.artic.edu/ryerson/copyrightlaw/7
- https://archive.artic.edu/ryerson/1479

Classification here: **U.S. public domain — strong evidence.**

Caution: commercial image agencies and some museum/estate pages still attach copyright notices to reproductions of the painting. That does not overturn the Art Institute's publication/renewal analysis, but it means we should distinguish copyright in the underlying artwork from claims attached to a particular reproduction.

## Public-domain candidates with weaker/secondary evidence

### Circle, c. 1938-1941

Wikimedia Commons currently marks the underlying work public domain in the United States on the theory that it was published in the United States between 1931 and 1963 and was not renewed.

- https://commons.wikimedia.org/wiki/File:Circle_by_Jackson_Pollock.jpg

Classification here: **U.S. public-domain candidate — secondary evidence; verify publication/renewal before treating as canonical.**

### Peddler, c. 1930-1935

This is a work on paper rather than an oil painting, but it is useful for the same deformation experiments. Wikimedia Commons marks it public domain in the United States on the theory that it was published without the required copyright notice.

- https://commons.wikimedia.org/wiki/File:Peddler_by_Jackson_Pollock.jpg
- Smithsonian object record: https://americanart.si.edu/artwork/peddler-19822

Classification here: **U.S. public-domain candidate — secondary evidence; verify publication/no-notice history.**

## Interesting but currently conflicting: do not vendor yet

### Number 1, 1950 (Lavender Mist)

There are conflicting signals:

- National Gallery of Art object page: https://www.nga.gov/artworks/55819-number-1-1950-lavender-mist
- Google Arts & Culture currently reports `Rights: CC0`: https://artsandculture.google.com/asset/number-1-1950-lavender-mist-jackson-pollock/UwGSV9KKMohFmA
- Wikimedia Commons has a recent file claiming public-domain status but its displayed rationale is not sufficient for a clean present-day worldwide conclusion: https://commons.wikimedia.org/wiki/File:Lavande_Mist,_Pollock,_NGA_Washington_1950.png

The NGA page currently says its media is not available for download. Because the sources disagree about what exactly is CC0/public-domain—the artwork, a reproduction, or provider metadata—**do not import an image file yet.**

### No. 2, 1950

A recent Wikimedia Commons file carries public-domain/Public Domain Mark language, but the page also says a United States public-domain tag is required. That is not enough evidence by itself.

- https://commons.wikimedia.org/wiki/File:Jackson_Pollock,_No._2,_1950_Harvard.jpg

Classification here: **unclear — do not vendor yet.**

### Collage and Oil, c. 1951

Direct conflict:

- Phillips Collection object page carries a Pollock-Krasner Foundation / ARS copyright notice: https://www.phillipscollection.org/collection/collage-and-oil
- Wikimedia Commons currently carries Public Domain Mark language: https://commons.wikimedia.org/wiki/File:Collage_and_Oil_Pollock_Phillips.jpg

Classification here: **conflicting — do not vendor.**

## Clearly treated as copyrighted by current primary sources

Examples checked:

- *Number 7, 1951* — National Gallery of Art: https://www.nga.gov/artworks/62619-number-7-1951
- *Number 7, 1952* — Metropolitan Museum of Art: https://www.metmuseum.org/art/collection/search/484954
- *Number 28, 1950* — Metropolitan Museum of Art: https://www.metmuseum.org/art/collection/search/490217
- *Number 27, 1950* — Whitney Museum: https://whitney.org/collection/works/2634
- *Stenographic Figure*, c. 1942 — MoMA: https://www.moma.org/collection/works/79686
- *One: Number 31, 1950* and *Moon Woman* are shown by the Pollock-Krasner Foundation with Pollock-Krasner Foundation / ARS copyright notices: https://www.pkf.org/pollock-krasner/jackson-pollock/

The Pollock-Krasner Foundation directs artwork-reproduction licensing requests to Artists Rights Society:
- https://www.pkf.org/about/resources/

Classification here: **do not import unless a work-specific public-domain/open-license basis is independently established.**

## Repository import rule

Before adding image bytes to this folder, record all of:

1. work title and date;
2. source institution;
3. source URL;
4. rights statement for the underlying artwork;
5. rights statement for the digital reproduction;
6. jurisdictional basis when the claim is public domain;
7. date checked.

For a public GitHub repository distributed globally, prefer a worldwide-expired work or an explicit open license over a merely U.S.-only public-domain conclusion. Until 1 January 2027, Pollock's 1956 death date still matters in many life-plus-70 jurisdictions.

## Why Pollock is useful for the Albers/stack experiments

Pollock gives a much richer deformation target than a two-color Albers fixture. We can perturb local color, density, line thickness, direction, connectedness, scale, crop, rotation, spatial frequency, layer ordering, and global composition while asking which transformations preserve or destroy a chosen notion of "the same painting."

That is exactly the kind of space where the distinction between local deformation directions and equivalence classes becomes interesting.