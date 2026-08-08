from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

SCRIPT_DIR = Path(__file__).resolve().parent

data_file_path = SCRIPT_DIR.parent / "original_stata" / "Stata datasets" / "data project dataset.dta"

# Import Stata .dta data using pathlib for cross-platform paths
# pandas accepts Path objects directly
df = pd.read_stata(data_file_path)

if __name__ == "__main__":
    print(df.describe())