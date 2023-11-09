# webapp_demo1
This package contains the analysis script and the raw data to reproduce the results from the first demo of Nostrum's web app

## Requirements
The analysis script requires the following:
* Python 2.7 or higher or Python 3.1 or higher must be installed.
* The Pandas and NumPy libraries are required.

## Usage

The script calculates the number and frequency of accepted and total catalytic poses (with the <b> -A CATE </b> option) along the [PELE](https://nostrumbiodiscovery.github.io/pele_docs/) simulation. To use it, you have to pass the path of the report files in the input (<b> -i PATH </b>) flag, specify the distance thresholds for the key substrate-enzyme distance (<b> -TE FLOAT </b>) and the critical distances between catalytic residues (<b> -CD FLOAT </b>), and pick the column numbers of the serine-substrate, serine-histidine, and histidine-acid distances (<b> -CE I1 I2 I3 </b>, the indexing is 1-based). The output name can be specified with the <b> -o STRING </b> flag, and the process can be run in parallel (<b> -NP NUM_OF_THREADS </b>). An example would be like this:

```
python PELEAnalyzer.py -i PATH_TO_THE_REPORT_FILES -TE 4.5 -CD 4.5 -CE 8 9 10 -NP 16 -A CATE -o OUTPUT
```

For more information on how to use the script or other options, use the <b> -h </b> flag to get the help message.
