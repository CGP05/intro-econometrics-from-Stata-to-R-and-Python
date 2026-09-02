import numpy as np
import matplotlib.pyplot as plt

# Set seed for reproducibility
np.random.seed(3)

# Roll a 6-sided die 10000 times
die = np.floor(np.random.uniform(1, 7, 10000)).astype(int)  # Corrected the upper limit to 7

# Create histogram
plt.bar(range(1, 7), np.bincount(die, minlength=7) / len(die) * 100, tick_label=range(1, 7), color='blue')
plt.title("Random Coin Flips (10000 Obs)")
plt.xlabel("Outcome")
plt.ylabel("Percentage")
plt.show()

# Set seed for a different result
np.random.seed(7)

# Roll a second 6-sided die 10000 times
die_2 = np.floor(np.random.uniform(1, 7, 10000)).astype(int)  # Corrected the upper limit to 7

# Add the results of two dice rolls
dice = die + die_2

# Create histogram
plt.bar(range(2, 13), np.bincount(die, minlength=13) / len(die) * 100, tick_label=range(2, 13), color='green')
plt.title("Random Dice Rolls (10000 Obs)")
plt.xlabel("Sum of Two Dice")
plt.ylabel("Percentage")
plt.show()
