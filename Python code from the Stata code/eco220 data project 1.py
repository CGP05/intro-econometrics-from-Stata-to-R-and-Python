from pathlib import Path

import pandas as pd

SCRIPT_DIR = Path(__file__).resolve().parent

data_file_path = SCRIPT_DIR.parent / "eco220 data project dataset.dta"


# Import Stata .dta data using pathlib for cross-platform paths
def load_data(file_path):
    """Loads a Stata .dta file into a pandas DataFrame."""
    return pd.read_stata(file_path)


def summarize(df):
    return df.describe()


def GDP_per_capita(df):
    # Stata equivalent: list Country GDP_PPP GDP_PPP_PER_CAPITA Overall_AI
    cols = ["Country", "GDP_PPP", "GDP_PPP_PER_CAPITA", "Overall_AI"]

    # Temporarily allow pandas to print all rows; reset afterward to avoid overwhelming other outputs.
    pd.set_option("display.max_rows", None)
    print("\nSelected columns (Country, GDP_PPP, GDP_PPP_PER_CAPITA, Overall_AI):")
    print(df[cols].to_string(index=False))
    pd.reset_option("display.max_rows")
