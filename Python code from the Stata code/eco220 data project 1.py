import pathlib
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn


#Import stata do file data, but use pathlib for cross platform
with open("eco220 data project 1.do", "r") as f:
    df = pd.read_stata(f)

df.describe()