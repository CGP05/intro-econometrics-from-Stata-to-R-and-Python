import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn


#Import our data when its an excel file
with open("eco220 data project 1.do", "r") as f:
    df = pd.read_stata(f)

df.describe()