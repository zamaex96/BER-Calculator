import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import PchipInterpolator, CubicSpline, interp1d

def readmatrix(file_path):
    return pd.read_excel(file_path).to_numpy()

def ber(data):
    ber_c = np.sum(data != 1)
    bsr_c = np.sum(data == 1)
    ber = ber_c / len(data)
    bsr = bsr_c / len(data)
    return ber, bsr

# Reading the data files
M1 = readmatrix('data2.xlsx')
ber1, bsr1 = ber(M1)
M2 = readmatrix('d2.xlsx')
ber2, bsr2 = ber(M2)
M3 = readmatrix('d3.xlsx')
ber3, bsr3 = ber(M3)
M4 = readmatrix('d4.xlsx')
ber4, bsr4 = ber(M4)
M5 = readmatrix('d5.xlsx')
ber5, bsr5 = ber(M5)
M6 = readmatrix('d6.xlsx')
ber6, bsr6 = ber(M6)
M7 = readmatrix('d7.xlsx')
ber7, bsr7 = ber(M7)
M8 = readmatrix('d8.xlsx')
ber8, bsr8 = ber(M8)
M9 = readmatrix('d9.xlsx')
ber9, bsr9 = ber(M9)
M10 = readmatrix('d10.xlsx')
ber10, bsr10 = ber(M10)
M11 = readmatrix('d11.xlsx')
ber11, bsr11 = ber(M11)

# Aggregating BER and BSR values
BER = [ber1, ber2, ber3, ber4, ber5, ber6, ber7, ber8, ber9, ber10, ber11]
BSR = [bsr1, bsr2, bsr3, bsr4, bsr5, bsr6, bsr7, bsr8, bsr9, bsr10, bsr11]

# Plotting
fig, axs = plt.subplots(2, 1, figsize=(10, 8))

# First subplot
axs[0].plot(range(1, 12), BSR, 'ks-', marker='s', linewidth=2, label='BSR')
axs[0].plot(range(1, 12), BER, 'bd-', marker='D', linewidth=2, label='BER')
axs[0].set_xlim([0, 12])
axs[0].set_ylim([0.45, 0.55])
axs[0].set_xlabel('Data (i)')
axs[0].set_ylabel('Rate (x)')
axs[0].legend()
axs[0].set_title('Plot')

# Second subplot
xq1 = np.linspace(1, 11, 1000)
p = PchipInterpolator(range(1, 12), BER)(xq1)
s = CubicSpline(range(1, 12), BER)(xq1)
m = interp1d(range(1, 12), BER, kind='cubic')(xq1)

axs[1].plot(range(1, 12), BER, 'o', label='Sample Points')
axs[1].plot(xq1, p, '-', label='pchip')
axs[1].plot(xq1, s, '-.', label='spline')
axs[1].plot(xq1, m, '--', label='makima')
axs[1].legend(loc='southeast')

plt.tight_layout()
plt.savefig('train_accuracy_loss_hybrid_plot.png')
plt.show()
