# Stacky notes around the single-pixel Jacobian

> **Status:** exploratory boundary note, not a claim that the color experiment already requires stacks. Review after the first contextual/two-pixel experiments.

The current experiment starts with the finite source lattice

`RGB8 = {0,...,255}^3`

and the chosen coordinate map

`RGB8 -> CIELAB`.

At one source pixel, the `h = 4` centered stencil gives a `3 x 3` finite-difference Jacobian. Because the source is discrete, this is best read as a local linear surrogate for nearby code-value changes, not as a literal tangent space already present in the RGB8 lattice.

## What is not stacky yet

The Jacobian answers a local sensitivity question in one presentation:

- choose RGB8 coordinates;
- map them to Lab coordinates;
- perturb one RGB coordinate at a time;
- measure the local Lab response.

Nothing in that computation says that two colors are equivalent, records a witness explaining an equivalence, supplies automorphisms of a color, or glues local presentations. A matrix of partial derivatives is therefore not evidence by itself that the computational object is a groupoid, quotient stack, or stack.

CIELAB itself should also not be treated as a moduli space merely because it is a useful coordinate space. It is an approximate perceptual coordinate model.

## Where stack-like structure might enter

Albers makes the interesting variable **context**. A displayed color can look different when its surround changes, and two physically different colors can sometimes be arranged to look surprisingly similar. That suggests studying a family indexed by context rather than trying to define one fixed global quotient of RGB values.

A possible future shape is:

- **base/context:** neighboring colors, layout, adaptation state, display conditions;
- **objects over a context:** concrete stimuli/presentations;
- **arrows:** explicit experimentally justified transformations or correspondences that count as perceptually the same for the question being asked;
- **coarse view:** throw away those arrows and retain only an equivalence class, if that is actually useful.

The arrows are the important part. Declaring `color A ~ color B` and immediately collapsing the pair to one class would lose the information that might make the construction genuinely groupoid-like.

Context dependence alone does not force a stack. A context-indexed metric or ordinary family may be enough. Stack language becomes justified only if explicit equivalences, changing stabilizers, local presentations, and gluing/descent behavior actually matter.

## A concrete symmetry warning for two pixels

For a two-color state `(left, right)`, swapping the two entries is **not automatically an equivalence**: the displayed arrangement has spatial structure. If some later experiment deliberately chooses to forget left/right labeling, then the swap becomes part of the stated equivalence relation. On the diagonal `(c,c)`, that swap fixes the state; away from the diagonal it generally does not. This is the sort of stabilizer jump that stack language is designed to retain, but only after the equivalence has been chosen for a real reason.

So: do not smuggle symmetries into the model because they make the mathematics interesting. The equivalence notion belongs to the experiment/problem statement.

## Relation to the Jacobian

The present Jacobian can still be useful underneath a richer construction. It gives local deformation/sensitivity data for one chart/presentation. Later experiments can ask whether two presentations that are equivalent in a richer sense have related local deformation data, or whether a coarse identification hides different local responses.

A particularly strong computational fixture would be:

1. two states are equal in the coarse perceptual classification;
2. their retained equivalence/stabilizer/context data differ;
3. that richer data predicts a different allowable or measured local deformation.

If such a fixture exists, the stacky bookkeeping is doing real work rather than decorating an ordinary quotient.

## Questions for review

1. Are we keeping the finite-difference Jacobian clearly separate from a deformation functor/tangent-space claim?
2. Does contextual color perception require anything beyond a family of context-dependent metrics?
3. What experimentally recordable data could serve as actual arrows/witnesses of perceptual equivalence?
4. Is there a useful case where a stabilizer changes and the change matters computationally?
5. Can local contextual descriptions be glued in a way that makes descent more than an analogy?
6. Can we produce the coarse-equality/different-local-deformation fixture above?
7. Are we over-reading CIELAB, whose perceptual uniformity is only approximate?

Until those questions have convincing answers, the safe statement is: **the single-pixel Jacobian is a local baseline; the possible stacky structure lives in the contextual equivalences layered above it.**
