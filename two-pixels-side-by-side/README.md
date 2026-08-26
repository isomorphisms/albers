# Two pixels side by side

This is the next experiment boundary: one RGB8 pixel on the left and one RGB8 pixel on the right.

Do **not** assume an interaction law yet.

At the source/image level the state is simply an ordered pair

`(left RGB8, right RGB8)`.

Using the single-pixel map independently gives the baseline

`(left RGB8, right RGB8) -> (left Lab, right Lab)`.

That product of two independent single-pixel color states is the thing an Albers-style contextual model has to beat. The first real questions are then experimental:

- if the left RGB8 value stays fixed while the right one moves, how does the perceived left color move?
- can two distinct RGB8 pairs become perceptually equivalent?
- are the locally available perceptual deformations of the left pixel different for different right-hand neighbors?
- does swapping left and right preserve anything, or is the ordered pair genuinely asymmetric under the viewing setup?

Those are reasons to keep the raw ordered pair, the independent CIELAB coordinates, and the later perception/context relation as separate layers. We should not call the result a quotient, groupoid, stack, or anything stronger until tests force that structure.

The first concrete pair should reuse the `single-pixel` swatch on one side and choose a second explicit RGB8 value on the other, then measure the one-code deformation neighborhoods again with the neighboring pixel held fixed.
