# Vocabulary resolution and coarse classification

> **Status:** conceptual note alongside the stacky boundary experiment. This does not claim that color perception, language, or social judgment is itself a stack.

## The motivating observation

A coarse vocabulary can manufacture apparent sameness.

A simple example outside color: calling a specialized IRC room “generic” can imply that the room or its subject is undistinguished, when what was actually meant was only “broader-topic rather than specifically devoted to Agda, Coq, type theory, or programming-language semantics.” Improving the vocabulary changes the classification.

That is directly relevant to Albers because these experiments already force us to separate a physical stimulus, a coordinate description, a perceptual report, and the surrounding context.

## Albers as a concrete warning against premature labels

Two patches can have identical RGB code values and look different in different surrounds. Conversely, physically different patches can be arranged to look strikingly similar. Therefore a label such as “same color” is incomplete until we say what notion of sameness is intended.

Likewise, labels such as “ordinary,” “generic,” “special,” or “degenerate” can hide the descriptive choices that produced them.

For the two-pixel experiment, the diagonal state

`(c, c)`

is mathematically special if we deliberately forget left/right labeling: the swap fixes it, so it has more symmetry than a typical `(c1, c2)`. But “special” here is structural information, not a judgment that the state is defective. Calling such a locus “degenerate” casually can smuggle an evaluative meaning into a technical distinction.

Albers gives a good physical lesson: **before deciding that two things are the same, ask which distinctions the description has forgotten and which context has been suppressed.**

## Vocabulary as measurement resolution

It is useful to think of descriptive vocabulary as a kind of resolution, without pretending that words are literally a numerical instrument.

At coarse resolution, many distinct situations may land under one term. At finer resolution, that class can split:

- same RGB code versus same CIELAB coordinate versus same reported appearance;
- same isolated patch versus same patch-in-context;
- same coarse category versus same local response to perturbation;
- generic-looking versus genuinely structurally generic.

The stacky notes already ask whether a coarse quotient loses information carried by context, equivalence witnesses, or stabilizers. Vocabulary supplies a parallel epistemic warning: sometimes the observer has performed the coarse quotient before the mathematics or experiment even starts.

## Broader caution

The same issue may occur when people describe an idea as cliché or a person as unintelligent, unsophisticated, or inferior. That is not a claim that human intelligence reduces to the color-perception example. The narrower lesson is that **failure to name a distinction is not evidence that the distinction is absent**.

A person with richer vocabulary may discover that several cases previously dismissed under one label have different structures. Conversely, fluent specialized vocabulary is not itself evidence that the speaker understands those structures.

For this project, keep the methodological rule simple:

1. state the presentation or coordinate system;
2. state the context;
3. state the equivalence notion;
4. only then form the coarse category or quotient;
5. do not turn technical specialness into an evaluative hierarchy.

Cross-project stacks note: <https://github.com/walnut-burgundy/computer-science/blob/stacks-moduli-and-deformation-notes/notes/vocabulary-resolution-genericity-degeneracy-and-coarse-quotients.md>.