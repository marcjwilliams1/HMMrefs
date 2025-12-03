# HMMrefs

Reference data package providing mappability and GC content data for HMMcopy binning analysis across multiple genome builds and bin sizes.

## Description

HMMrefs is an R data package that provides pre-processed reference data for HMMcopy analysis. The package includes mappability scores and GC content data for both GRCh37 (hg19) and GRCh38 (hg38) genome builds, across multiple bin sizes ranging from 10kb to 5Mb.

## Installation

Install HMMrefs from GitHub using:

```r
# Using devtools
devtools::install_github("marcjwilliams1/HMMrefs")

# Or using remotes
remotes::install_github("marcjwilliams1/HMMrefs")
```

## Usage

After installation, load the package and access the reference data:

```r
library(HMMrefs)

# Access data for hg19 with 10kb bins
hg19_10kb <- references$hg19$"10000"

# Access data for hg38 with 200kb bins
hg38_200kb <- references$hg38$"200000"

# View the structure
head(hg19_10kb)
```

## Data Structure

The `references` dataset is a nested list structure organized as:

```
references
├── hg19 (GRCh37)
│   ├── "10000"    (10kb bins)
│   ├── "20000"    (20kb bins)
│   ├── "50000"    (50kb bins)
│   ├── "100000"   (100kb bins)
│   ├── "200000"   (200kb bins)
│   ├── "500000"   (500kb bins)
│   ├── "1000000"  (1Mb bins)
│   ├── "2000000"  (2Mb bins)
│   └── "5000000"  (5Mb bins)
└── hg38 (GRCh38)
    ├── "10000"    (10kb bins)
    ├── "20000"    (20kb bins)
    ├── "50000"    (50kb bins)
    ├── "100000"   (100kb bins)
    ├── "200000"   (200kb bins)
    ├── "500000"   (500kb bins)
    ├── "1000000"  (1Mb bins)
    ├── "2000000"  (2Mb bins)
    └── "5000000"  (5Mb bins)
```

Each data frame contains the following columns:

- **chr**: Chromosome name (e.g., "chr1", "chr2", etc.)
- **start**: Start position of the bin (1-based)
- **end**: End position of the bin
- **mappability**: Mappability score for the bin
- **gc**: GC content score for the bin

## Available Bin Sizes

The following bin sizes are available for both genome builds:

- 10,000 bp (10kb)
- 20,000 bp (20kb)
- 50,000 bp (50kb)
- 100,000 bp (100kb)
- 200,000 bp (200kb)
- 500,000 bp (500kb)
- 1,000,000 bp (1Mb)
- 2,000,000 bp (2Mb)
- 5,000,000 bp (5Mb)

## Example

```r
library(HMMrefs)

# Get hg19 reference data with 100kb bins
ref_data <- references$hg19$"100000"

# View first few rows
head(ref_data)

# Filter for chromosome 1
chr1_data <- ref_data[ref_data$chr == "chr1", ]

# View summary statistics
summary(ref_data$mappability)
summary(ref_data$gc)
```

## License

See the DESCRIPTION file for license information.

## Bug Reports

Report issues at: https://github.com/marcjwilliams1/HMMrefs/issues

