#!/bin/env python2.7

import pandas as pd


def main():#FILE):
#    pd.read_excel(FILE, sheetname = 4).to_csv('bufferspase.tsv',sep = "\t")
    Slurp_Sheet = open('bufferspase.tsv', 'r')

    #Initialize lists
    keys = []
    sp = []
    col2 = []
    col4 = []

    #Loop through lines in the Slurp Sheet storing data in relevant lists
    count = 0
    for lines in Slurp_Sheet:
        ##  POP ORDER SHOULD BE 1, 2, 4 WHEN USING PANDAS
        if lines.rstrip("\n").split("\t").pop(1) != "":
            if count < 12:
                keys.append(lines.rstrip("\n").split("\t").pop(1))
            else:
                keys.append(lines.rstrip("\n").split("\t").pop(1))
                sp.append(lines.rstrip("\n").split("\t").pop(1))

        if lines.rstrip("\n").split("\t").pop(2) != "":
            col2.append(lines.rstrip("\n").split("\t").pop(2))

        if lines.rstrip("\n").split("\t").pop(4) != "":
            col4.append(lines.rstrip("\n").split("\t").pop(4))

        count += 1

    #Convert lists to dictionaries with empty values
    transect_data = dict.fromkeys(keys)
    area_data = dict.fromkeys(sp)

    #Save metadata into transect_data dictionary
    for metadata in range(0,12):
        transect_data[keys[metadata]] = col2[metadata].rstrip("\r").rstrip("\n")

    #Save transect frequencies into transect_data dictionary
    for frequencies in range(12,len(col2)):
        if col2[frequencies].rstrip("\r").rstrip("\n") != "":
            transect_data[keys[frequencies]] = col2[frequencies]

    #Save observed species into area_data dictionary
    for observed in range(len(sp)):
        if col4[observed].rstrip("\r").rstrip("\n") != "":
            area_data[sp[observed]] = 1
        else:
            area_data[sp[observed]] = 0

    #Create formatted string for output
    out_string = "%s\t"*(len(keys) + len(sp))

    #Combine values from transect_data and area_data dictionaries into one list
    dict_values = []
    for j in range(len(keys)):
        dict_values.append(transect_data[keys[j]])
    for k in range(len(sp)):
        dict_values.append(area_data[sp[k]])

    #Print the formatted string (ideally, this is saved into a file)
    print out_string % tuple(dict_values)

#main("C:/Users/rose3222/Downloads/Dunes Sandbox/Template_prototype.xlsm")
main()
