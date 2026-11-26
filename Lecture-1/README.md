# Lecture 01: Signal Visualization

## Task 2: Compare Different Frequencies
1. **Which signal changes fastest?** The 10 Hz sine wave changes fastest.
2. **Which signal has the lowest frequency?** The 2 Hz sine wave has the lowest frequency.
3. **How can you see the difference in the plots?** Over the 1-second window, the 2 Hz plot shows 2 full cycles, the 5 Hz plot shows 5 full cycles, and the 10 Hz plot shows 10 full cycles—higher frequency compresses the wave peaks closer together in time.

## Task 3: Compare Different Amplitudes
1. **Which signal has the largest amplitude?** The sine wave with amplitude 2 has the largest peak magnitude (reaching +2 and -2).
2. **Does changing amplitude change frequency?** No. Scaling amplitude changes the vertical peak height, while the number of cycles per second (frequency) and period stay identical.
3. **Give one real-world example where amplitude is important.** Audio signals: higher signal amplitude corresponds to louder sound pressure before reaching speaker or amplifier clipping.

## Task 4: Add Noise
1. **What changed after adding noise?** High-frequency jagged fluctuations appeared across the waveform, increasing peak-to-peak variation and roughing up the smooth curve.
2. **Can you still recognize the original signal?** Yes. Even with random fluctuations added, the periodic 5 Hz rise-and-fall pattern and approximate amplitude envelope remain visible.
3. **Give one real-world source of signal noise.** Thermal agitation of electrons inside resistors and sensor front-end circuits (Johnson-Nyquist thermal noise).

## Task 6: Responsible AI Use
- **AI Tool Used:** Gemini
- **Prompt:** Generated a starter MATLAB script for sine wave creation, frequency/amplitude subplots, Gaussian noise addition, and PNG figure export.
- **What AI Suggested:** Code using `sin(2*pi*f*t)`, `subplot`, `randn`, and `saveas` to export the three required PNG files.
- **Did the code work immediately?** NO
- **What did you modify?** Used the generated structure directly as a baseline and verified the parameters (`duration = 1`, frequencies `2/5/10 Hz`, amplitudes `0.5/1/2`, and reproducible noise seed) against the assignment specifications.
- **How did you verify the result?** Inspected every plot in MATLAB and opened the three exported `.png` files (`frequency_comparison.png`, `amplitude_comparison.png`, and `clean_vs_noisy_signal.png`) to confirm accurate cycle counts, y-axis peak bounds (`±0.5`, `±1`, `±2`), axis labels, titles, and grid visibility.
