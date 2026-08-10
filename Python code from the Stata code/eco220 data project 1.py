from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

SCRIPT_DIR = Path(__file__).resolve().parent

data_file_path = SCRIPT_DIR.parent / "original_stata" / "Stata datasets" / "data project dataset.dta"

# Import Stata .dta data using pathlib for cross-platform paths
# pandas accepts Path objects directly
df = pd.read_stata(data_file_path)

def summarize(df):
    return df.describe()


    # Stata equivalent: list Country GDP_PPP GDP_PPP_PER_CAPITA Overall_AI
    cols = ['Country', 'GDP_PPP', 'GDP_PPP_PER_CAPITA', 'Overall_AI']

    # Print all rows for these columns (like Stata's `list` which shows every observation)
    # Temporarily allow pandas to print all rows; reset afterward to avoid overwhelming other outputs.
    pd.set_option('display.max_rows', None)
    print('\nSelected columns (Country, GDP_PPP, GDP_PPP_PER_CAPITA, Overall_AI):')
    print(df[cols].to_string(index=False))
    pd.reset_option('display.max_rows')
