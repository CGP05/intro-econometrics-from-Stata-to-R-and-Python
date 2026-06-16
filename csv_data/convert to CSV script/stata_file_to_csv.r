#script I used to convert the proprietary Stata Dataset formatted files into CSV files
#copied directly from JakeC007, located here: https://github.com/JakeC007/dta-to-csv-converter/blob/main/convert/stata_convert.Rmd

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# Check if haven package is installed
if (!requireNamespace("haven", quietly = TRUE)) {
  # If not installed, install it
  install.packages("haven")
}
```


```{r convert}
library(haven)

# Get the path to the current directory
current_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

# List all files in the current directory
files <- list.files(current_dir)

# Look for Stata files
stata_files <- files[grep("\\.dta$", files)]

if (length(stata_files) > 0) {
  # If at least one Stata file is found, read in the first one
  stata_file <- file.path(current_dir, stata_files[1])
  data <- read_dta(stata_file)
  
  # Define the path for the CSV file
  csv_file <- file.path(current_dir, paste0(tools::file_path_sans_ext(stata_files[1]), ".csv"))
  
  # Write the data to CSV
  write.csv(data, file = csv_file, row.names = FALSE)
  
  cat("Stata file has been successfully converted to CSV:", csv_file, "\n")
} else {
  cat("No Stata file found in the current directory.\n")
}

```
