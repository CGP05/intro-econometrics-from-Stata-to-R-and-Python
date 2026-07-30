import pathlib
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn

SCRIPT_DIR = Path(__file__).resolve().parent

do_file_path = SCRIPT_DIR.parent / "original_stata" / "Stata Do-files" / "eco220 data project 1.do"

#Import stata do file data, but use pathlib for cross platform
with open("eco220 data project 1.do", "r") as f:
    df = pd.read_stata(f)

df.describe()