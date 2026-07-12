import pandas as pd
import numpy as np
import statsmodels.formula.api as smf
import seaborn
import matplotlib.pyplot as plt

#Import our data when its an excel file
with open("ECO220_DataProject_AI.xlsx", "r") as f:
    df