# ECO220 - Introduction to Data Analysis and Applied Econometrics

## Project Overview

This repository contains the conversion of Stata .do files to both R and Python implementations for the ECO220 course. The original Stata workflow has been transformed to modern data analysis tools while maintaining identical analytical results.

## Conversion Strategy

### Primary Tools
- **Python**: Pandas (not just NumPy) for data manipulation and analysis
- **R**: Quarto for reproducible research documentation
- **Python visualization**: Jupyter notebooks with Matplotlib/Seaborn
- **R visualization**: Quarto documents with ggplot2

### Why These Choices?
- **Pandas**: Superior for Stata-to-CSV data import, complex variable operations, and missing data handling
- **Jupyter notebooks**: Interactive learning environment perfect for educational content
- **Quarto**: Professional academic documentation with both HTML and PDF output
- **Consistency with existing**: Matches the project's established conversion infrastructure

## File Conversion Plan

### Phase 1: Foundation Files (2-3 hours total)

**1. Prac1_Key.do** (1,625 bytes, ~49 lines)
- Focus: Basic Stata operations that appear across all files
- Key concepts: Data import, variable renaming, mathematical equations
- Output: Clean, understandable conversion demonstrating core principles

**2. practical 7 submission questions.do** (1,455 bytes, ~18 lines)
- Focus: Simplified Stata operations from TA key
- Key concepts: Basic data manipulation, equation solving, integration
- Output: Reinforcement of fundamental patterns

### Phase 2: Intermediate Complexity (4-5 hours)

**3. Lab4 for practical 7.do** (3,878 bytes, medium complexity)
- Focus: Extended data visualization and multi-step operations
- Key concepts: Advanced plotting, data processing pipelines
- Output: Comprehensive visualization examples

### Phase 3: Master Analysis (8-10 hours)

**4. eco220 data project 1.do** (4,674 bytes, most complex)
- Focus: Complete synthesis of all learned concepts
- Key concepts: Complex region categorization, statistical operations, full analytical pipeline
- Output: Professional-grade analysis matching original Stata functionality

## Implementation Details

### Python Structure (Jupyter Notebooks)
```python
# Core packages
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Mathematical operations
from scipy import stats
import statsmodels.api as sm
```

### R Structure (Quarto)
```r
# In .Rmd/Quarto files:
---
title: "ECO220 Data Analysis Conversions"
author: "Your Name"
date: "November 1, 2024"
format:
  html:
    toc: true
    code-fold: true
  pdf:
    default:
---

library(tidyverse)
library(ggplot2)
library(haven)
```

## Key Technical Challenges & Solutions

### 1. Data Import Complexity
**Stata**: `import excel "file.xlsx", sheet("data") firstrow`
**Python**: `pd.read_excel("file.xlsx", sheet_name="data")`
**R**: `readxl::read_excel("file.xlsx", sheet="data")`

### 2. Variable Creation
**Stata**: `generate GDP_PPP_PER_CAPITA = GDP_PPP / (POP * 1000)`
**Python**: `df['GDP_PPP_PER_CAPITA'] = df['GDP_PPP'] / (df['POP'] * 1000)`
**R**: `GDP_PPP_PER_CAPITA <- GDP_PPP / (POP * 1000)`

### 3. Data Categorization (Most Complex)
The region categorization in eco220 data project 1.do requires careful translation:
- **Stata**: Multiple `inlist()` operations
- **Python/R**: `np.select()` or `case_when()` functions

### 4. Statistical Operations
**Stata**: `cor Overall_AI GDP_PPP_PER_CAPITA`
**Python**: `df[['Overall_AI', 'GDP_PPP_PER_CAPITA']].corr()`
**R**: `cor(Overall_AI, GDP_PPP_PER_CAPITA)`

### 5. Visualization Translation
**Stata**: `graph bar (mean) Overall_AI ...`
**Python**: `ggplot(df, aes(x=..., y=...)) + geom_bar(stat='summary')`
**R**: `ggplot(df, aes(x=..., y=...)) + geom_bar(stat='summary')`

## Time Estimates

| File | Size | Est. Time | Complexity |
|------|------|-----------|------------|
| Prac1_Key.do | 1,625 bytes | 2-3 hours | Low |
| practical 7 submission questions.do | 1,455 bytes | 1-2 hours | Low |
| Lab4 for practical 7.do | 3,878 bytes | 4-5 hours | Medium |
| eco220 data project 1.do | 4,674 bytes | 8-10 hours | High |

**Total: 15-20 hours** (more focused than initial 11-19 estimate)

## Conversion Workflow

1. **Start with small files**: Build confidence and establish patterns
2. **Extract reusable functions**: Common operations across all files
3. **Progressive enhancement**: Add complexity step-by-step
4. **Validate outputs**: Ensure identical results to original Stata
5. **Document thoroughly**: Use Jupyter/Quarto for reproducible research

## Expected Outputs

### Python (Jupyter Notebooks)
- Complete data import and preprocessing
- Variable creation and transformation
- Statistical analysis and correlation matrices
- Professional visualizations (histograms, scatter plots, box plots)
- Export capabilities for further analysis

### R (Quarto Documents)
- Code chunks with clear explanations
- HTML and PDF documentation
- Interactive code execution
- Professional academic formatting

## Quality Assurance

- **Result validation**: Compare outputs with original Stata results
- **Code review**: Ensure clean, well-documented implementations
- **Testing**: Verify edge cases and error handling
- **Documentation**: Comprehensive comments and explanations

## Next Steps

1. Begin with Prac1_Key.do conversion
2. Establish reusable function templates
3. Create Jupyter notebook structure
4. Set up Quarto document templates
5. Implement systematic testing approach

This conversion project will produce a comprehensive set of modern data analysis tools that maintain the educational value of the original Stata materials while providing students with industry-standard skills in Python and R.
