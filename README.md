# BER and BDR Calculation from Log File

This repository contains a Python script for calculating Bit Error Rate (BER) and Bit Delivery Rate (BDR) from a log file consisting of binary 0s and 1s. The script is an equivalent of a MATLAB script that performs the same calculations and plots the results.

## Key Points

1. **Data Reading**: 
   - The `readmatrix` function in MATLAB is replaced with `pd.read_excel` from the `pandas` library to read Excel files into `numpy` arrays.

2. **Calculation of BER and BDR**: 
   - The `ber` function remains almost the same, just adapted to Python syntax.

3. **Plotting**: 
   - `matplotlib` is used for plotting, similar to MATLAB's plotting functions. The interpolation functions `PchipInterpolator`, `CubicSpline`, and `interp1d` from `scipy` are used for smooth curves.

## Required Libraries

To run this script, you need the following Python libraries:
* `numpy`: For numerical operations.
* `pandas`: For reading Excel files.
* `matplotlib`: For plotting.
* `scipy`: For interpolation.

You can install these libraries using `pip` if they are not already installed:
```sh
pip install numpy pandas matplotlib scipy
```


<div align="center">
  <a href="https://maazsalman.org/">
    <img width="70" src="click-svgrepo-com.svg" alt="gh" />
  </a>
  <p> Explore More! 🚀</p>
</div>
