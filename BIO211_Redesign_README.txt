DunesLabOldData.py/olddata.sh/DunesLabCompiler.py
Nicholas Heyer, Sophia Rose, Madison McCarty, Zane Toyon
Python version 2.7

DunesLabOldData.py is used to reformat past Excel sheets into a master tsv file. It's intended to be used in a BASH loop
appending to some file that will become the master tsv. DunesLabOldData.py prints standard errors to console informing
of any data entry errors found that cannot be resolved by this script. This script works with any tab-separated file
format, but we have provided 26 sample .txt files for use.

olddata.sh is an example for-loop that will run DunesLabOldData.py on .txt files and append the output to a
tab-separated values file called "compiled" with the date the script was run on. It is written assuming that
DunesLabOldData.py is in the same directory as the .txt files. The compiled file will not automatically have the .tsv
as the file extension and it will need to be added manually after the loop has completed.

DunesLabCompiler.py is used for new data sheets created using the provided .xlsm or .xlsx templates. It's intended to
be used in the same manner as DunesLabOldData.py.

The outputted tsv files from both of these scripts must have the .tsv file extension to be used with the provided
SQL database scripts.

These Python scripts were built under Python 2.7. For systems using any version of Python 3, all print statements
will need to be changed to include parentheses around whatever is being printed (Lines 13, 321, and debug statements)
