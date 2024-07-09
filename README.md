Matlab file which calculates bit error rate (BER) and bit deleivery rate (BDR) from a log file (consists of binary 0 and 1).
                                                                                    The equivalent Python code
Key Points:
Data Reading: 
The readmatrix function is replaced with pd.read_excel from the pandas library to read the Excel files into numpy arrays.

Calculation of BER and BSR: 
The ber function remains almost the same, just adapted to Python syntax.

Plotting: 
matplotlib is used for plotting, similar to MATLAB's plotting functions. The interpolation functions PchipInterpolator, CubicSpline, and interp1d from scipy are used for smooth curves.
                                                                                    
Required Libraries:
* numpy: For numerical operations.
* pandas: For reading Excel files.
* matplotlib: For plotting.
* scipy: For interpolation.
  
Install these libraries using pip if they are not already installed:
                                         pip install numpy pandas matplotlib scipy

This Python script should be functionally equivalent to the provided MATLAB script, and it will plot the BER and BSR values along with the interpolations. 
Adjust file paths and configurations as needed.
