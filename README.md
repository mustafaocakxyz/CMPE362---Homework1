# CMPE362 Homework1

First, most obvious and expected observation is that as N increases, Fourier series fit better and better to the actual square wave. Oscillations get narrower.

Also, the peak is approaching ~1.179 hence absolute overshoot approaches 0.179. This matches the theoretical Gibbs overshoot G * Δ where G = 0.0894899 and Δ = 2.


## Why overshoot persists?

The overshoot does not vanish because a Fourier series is made of smooth sine waves, and it cannot represent a sudden jump exactly. As we add more harmonics, the ripples near the discontinuity become narrower but keep about the same height (around 9% of the jump). This constant overshoot is known as the Gibbs phenomenon.
