# CMPE362 Homework1

## Figures & Outputs

### Overshoot Valuse wrto N
<img width="584" height="83" alt="Screenshot 2025-10-17 at 16 52 39" src="https://github.com/user-attachments/assets/a35be597-8723-48ff-b632-b9fd684751d3" />

### Fourier Series and Square Wave
<img width="819" height="649" alt="Screenshot 2025-10-17 at 16 53 27" src="https://github.com/user-attachments/assets/3ca50195-9b71-491c-b629-26a85f146ef4" />

## Observations

First, most obvious and expected observation is that as N increases, Fourier series fit better and better to the actual square wave. Oscillations get narrower.

Also, the peak is approaching ~1.179 hence absolute overshoot approaches 0.179. This matches the theoretical Gibbs overshoot G * Δ where G = 0.0894899 and Δ = 2.


## Why overshoot persists?

The overshoot does not vanish because a Fourier series is made of smooth sine waves, and it cannot represent a sudden jump exactly. As we add more harmonics, the ripples near the discontinuity become narrower but keep about the same height (around 9% of the jump). This constant overshoot is known as the Gibbs phenomenon.
