# 🌐 Design of Direct Sequence-Spread Spectrum System (DSSS)

**Author:** Abdelrahman Khaled Elsayed  
**Email:** [abdokhaled1712002@gmail.com](mailto:abdokhaled1712002@gmail.com)

---

## 📘 Overview

This project presents the **design and implementation of a Direct Sequence-Spread Spectrum (DS-SS) system** using **Binary Phase Shift Keying (BPSK)** modulation.  
It demonstrates how a digital data signal can be spread over a wider bandwidth using a **Pseudo-Noise (PN)** sequence and later recovered using a synchronized replica of that sequence.  

The system is modeled and simulated using **MATLAB** and **FPGA design principles**, showcasing key concepts in digital communications and signal processing.

---

## ⚙️ System Description

### 🔹 What is DSSS?

**Direct Sequence-Spread Spectrum (DS-SS)** is a modulation technique that spreads a narrowband signal across a wider frequency band by multiplying it with a high-rate pseudo-random binary sequence.  
At the receiver, the same PN sequence is used to **de-spread** the signal, recovering the original data.  
This method enhances resistance to interference, jamming, and eavesdropping.

---

## 🧩 System Components

### 1. PN Sequence Generator
A **Pseudo-Noise (PN)** sequence is generated using **Linear Feedback Shift Registers (LFSRs)**.

**Specifications:**
- Clock frequency for PN: `Fpn = 100 kHz`  
- LFSR length: `N = 4`  
- Sequence length: `L = 2^N − 1 = 15`  
- FPGA board clock: `Fb = 50 MHz`  
- Clock divider: `Fb / Fpn = 500`

**Calculated Parameters:**
- Chip period: `Tc = 1 / 100 kHz = 10 µs`  
- Bit period: `Td = L × Tc = 15 × 10 µs = 150 µs`

---

### 2. DS-SS Transmitter
The transmitter multiplies the input data bits `m(t)` with the PN sequence `p(t)` to produce the **spread signal**.  
The multiplication is performed digitally using an **XNOR gate**.

**Specifications:**
- PN Chip rate: `Tc = 10 µs`  
- Data bit rate: `Tb = 150 µs`

---

### 3. Oscillator Design
A digital sine wave oscillator is implemented using a **Look-Up Table (LUT)**.

**Specifications:**
- Sampling rate: `Fs = 25 MHz`  
- Samples per cycle: `N = 36`  
- Resulting carrier frequency:  
  `Fc = Fs / N = 25 MHz / 36 ≈ 700 kHz`

**Implementation Steps:**
1. Generate sine samples using: `sin(i × 2π / N)`  
2. Convert to fixed-point (8-bit, 6 fractional bits)  
3. Store values in a LUT for real-time use

---

### 4. BPSK Modulator
A **Binary Phase Shift Keying (BPSK)** modulator uses the spread binary sequence to control the phase of the carrier.

**Operation:**
- Input bit `1` → transmit carrier unchanged  
- Input bit `0` → shift carrier phase by **180°**

This effectively encodes the binary data into phase variations of the sine wave carrier.

---

## 🧮 Mathematical Summary

| Parameter | Symbol | Formula | Value |
|------------|---------|----------|--------|
| PN Chip Rate | Fc | `1 / Tc` | 100 kHz |
| Data Bit Period | Td | `L × Tc` | 150 µs |
| Carrier Frequency | Fc | `Fs / N` | ≈ 700 kHz |

---

## 💻 Implementation Details

- **Design Platform:** MATLAB / FPGA  
- **Clock Divider:** 500 cycles for PN clock  
- **Logic Components:** D-Flip-Flops, XNOR gates  
- **Signal Generation:** LUT-based oscillator  
- **Modulation Type:** BPSK  

---

## 📈 Simulation Results

- PN sequence waveform successfully generated  
- BPSK modulated output demonstrates correct phase inversion  
- MATLAB plots validate spreading and modulation performance  

  
> <img width="512" height="113" alt="image" src="https://github.com/user-attachments/assets/62a916e9-dee2-4bb1-bb4c-11f3a42e5384" />

---

## 🧠 Key Learnings

- Principles of **spread spectrum communication**  
- **PN sequence** and **LFSR** design  
- **BPSK modulation** and phase control  
- Hardware-oriented digital signal modeling  
- Integration of MATLAB simulation and FPGA design concepts  

---

## 🚀 Future Work

- Implement DSSS **receiver** with synchronization  
- Add **error detection and correction** mechanisms  
- Test under **AWGN** and multipath conditions  
- Deploy full system on FPGA hardware  

---

## 📚 References

- Simon Haykin, *Communication Systems*, 5th Edition  
- MATLAB DSP System Toolbox documentation  
- FPGA-based DSSS & BPSK design tutorials  

---

## 🏷️ License

This project is released under the **MIT License**.  
You are free to use, modify, and distribute this work with proper attribution.

---

## 🌟 Acknowledgment

Special thanks to academic mentors and communication systems researchers whose work inspired this project.

---

