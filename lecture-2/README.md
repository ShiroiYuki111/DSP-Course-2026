# Lecture 02 – Sampling and Aliasing

## Objective
This assignment investigates how sampling a 10 Hz sine wave over 1 second at 15 Hz, 20 Hz, 25 Hz, 50 Hz, and 100 Hz affects discrete-time signal representation, identifies where aliasing occurs, and evaluates practical sampling choices for an industrial machine condition-monitoring system.

## Nyquist Analysis
For a signal with maximum frequency $f_{\max} = 10\text{ Hz}$, the minimum sampling frequency (Nyquist rate) is:
$$f_s \ge 2 f_{\max} = 2 \times 10\text{ Hz} = 20\text{ Hz}$$

1. **Which sampling frequencies satisfy the Nyquist criterion?**  
   **20 Hz, 25 Hz, 50 Hz, and 100 Hz** satisfy $f_s \ge 20\text{ Hz}$ (with 20 Hz sitting right on the Nyquist limit). **15 Hz** does not satisfy the Nyquist criterion because $15\text{ Hz} < 20\text{ Hz}$.
2. **Is sampling exactly at the Nyquist rate recommended in practice? Explain your answer.**  
   No. Sampling right at $2f_{\max}$ (20 Hz) leaves zero guard band for practical anti-aliasing filters (which have finite roll-off rather than an ideal brick-wall cutoff), can produce zero-amplitude samples on a sine wave aligned with zero-crossings ($t = 0.05n\text{ s}$), and provides no room to capture higher-frequency machine harmonics or noise without folding.

## Results
- **Original Signal (`original_signal.png`):** A smooth 10 Hz sine wave over 1 second (10 full cycles, amplitude $\pm 1$, period $0.1\text{ s}$) plotted with a fine time step ($f_s = 10{,}000\text{ Hz}$).
- **15 Hz (`sampling_15Hz.png`, $T_s = 0.0667\text{ s}$):** Undersampled below the 20 Hz Nyquist rate; the 16 samples over 1 second alternate between $0$, $\approx +0.866$, and $\approx -0.866$, tracing a slower apparent wave rather than the true 10 Hz oscillation.
- **20 Hz (`sampling_20Hz.png`, $T_s = 0.0500\text{ s}$):** Sits right on the Nyquist boundary (2 samples per 10 Hz cycle); because $\sin(2\pi \cdot 10 \cdot 0.05k) = \sin(\pi k) = 0$, every sample lands at zero amplitude, showing why sampling exactly at the Nyquist rate is fragile in practice.
- **25 Hz (`sampling_25Hz.png`, $T_s = 0.0400\text{ s}$):** Above the Nyquist limit (2.5 samples per cycle); captures the 10 Hz oscillation trend across the 1-second window, though the coarse spacing makes the wave look angular.
- **50 Hz (`sampling_50Hz.png`, $T_s = 0.0200\text{ s}$):** Provides 5 samples per 10 Hz cycle, outlining peaks, troughs, and zero-crossings much more clearly.
- **100 Hz (`sampling_100Hz.png`, $T_s = 0.0100\text{ s}$):** Provides 10 samples per 10 Hz cycle, closely tracking the continuous-time sine wave shape.

## Aliasing Discussion
Aliasing occurs at **15 Hz** (and exhibits critical Nyquist-boundary behavior at **20 Hz**) because the sampling interval is too coarse to capture the 10 Hz oscillation unambiguously. When a signal is sampled below the Nyquist rate, high-frequency energy folds back into lower apparent frequencies (spectral folding), making a fast vibration appear as a slower frequency that corrupts diagnostics. At **20 Hz**, samples taken every $0.05\text{ s}$ align directly with the 10 Hz sine wave's zero-crossings, yielding all-zero samples and demonstrating why operating right on the Nyquist limit is unreliable.

For a practical industrial condition-monitoring system, I recommend **100 Hz** (or higher if bearing/gear harmonics are present). At 100 Hz (10x the 10 Hz signal), waveform fidelity is high enough for accurate time-domain and ML feature extraction, anti-aliasing filters have ample transition margin below the 50 Hz Nyquist frequency, and the sample rate remains lightweight for real-time embedded processing, storage, and noise resilience.

## Engineering Recommendation
I recommend **100 Hz** for practical condition monitoring because it preserves waveform detail, gives anti-aliasing filters room to roll off cleanly below 50 Hz, and avoids excessive data volume or compute overhead.

## AI Usage
- **AI Tool Used:** Gemini
- **Prompt(s):** Provided the Lecture 02 sampling and aliasing assignment instructions and shared the generated plots for verification and README drafting.
- **Summary of AI Response:** Generated a MATLAB script (`Lecture02_sampling_aliasing.m`) creating a 10 Hz continuous-approximation sine wave, sampling it at 15, 20, 25, 50, and 100 Hz with `stem` plots, saving the six PNG files, and structuring `README.md` with Nyquist analysis, observations, aliasing discussion, and engineering recommendation.
- **What I Modified:** Ran the script in MATLAB R2026b, exported all six figures, and updated the `README.md` observations to reflect the exact sampled values and plot behavior.
- **How I Verified the Results:** Executed `Lecture02_sampling_aliasing.m` in MATLAB R2026b without errors and visually inspected `original_signal.png`, `sampling_15Hz.png`, `sampling_20Hz.png`, `sampling_25Hz.png`, `sampling_50Hz.png`, and `sampling_100Hz.png` to confirm cycle counts, sample spacing, titles, axis labels, legends, and grids.
```[cite: 7, 8, 9, 10, 11, 12]

The `## Aliasing Discussion` section comes out to ~155 words, keeping it safely under the 200-word cap.
