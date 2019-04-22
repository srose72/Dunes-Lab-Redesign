#!/bin/env python2.7


import sys


# define outermost shell to run the code from unix using the flag -p for path
def main():
    import sys
    flag = 0
    for j in range(len(sys.argv)):
        if sys.argv[j] in ['-p','--path']:
            print run(sys.argv[j+1])
            flag = 1
        if sys.argv[j] in ['-h','--help']:
            flag = 1
            sys.stderr.write('''
            Usage:\n
            -h\t--help\t|desplay this message\n
            -p\t--path\t|import path of a tab deliminated file\n
            ____________________________________________________________________________________\n
            This script is intended for usage in a unix loop\n
            ''')
	elif j == len(sys.argv) and flag == 0 :
            sys.stderr.write('No flag detected use -h to desplay help ')


# function to parse the string of important data
def StoDandM(x):
    # all data groupings were split by commas so parse it by them
    list = x.split(",")
    metadata = []
    data = []
    # put all strings with 3 tabs into metadata location, and all with 2 into data spliting by tabs to turn strings into lists
    for string in list:
        str_list = string.split("\t")
        if len(str_list) == 3:
            metadata.append(str_list)
        else:
            data.append(str_list)
    return [metadata,data]

# function to determine date format
def gate_calc(date_data):
    gate = ""
    # loop thorough all the chracters in the date string
    for chr_date in date_data:
            # see if there is text and set character in the date if so set gate to text
            if chr_date.isdigit() == False and chr_date not in ["/", "-",  " ", ":"] :
                gate = "text"
                break
            # see if there is a slash in it then set the gate to slash
            elif chr_date == "/":
                gate = "slash"
            #see if there is a dash in it then set the gate to dash
            elif chr_date == "-":
                gate = "dash"
            # test to see if it has hr:min:sec data from splitting things (should always be 00:00:00)
            elif chr_date == ":":
                gate = 'removal'

    return gate

# function to turn all possible GPS formats to decimal degrees
def fixGPS(GPS_input_in):
    import re
    GPScol = 0
    lat = 0
    lon = 0

    # regex for the two formats GPS data could be given in
    two_num = r"([\d\.]+)(\D+)([\d\.]+)"
    three_num = r"([\d\.]+)(\D+)([\d\.]+)(\D+)([\d\.]+)"

    # Loop through both GPS columns, check which format the numbers were given in
    # Negate longitude if not already
    for GPScol in (1, 2):
        GPS_input = GPS_input_in[GPScol].lstrip(" ")
        temp_GPS = re.search(three_num, GPS_input) # three number format

        if not temp_GPS:
            temp_GPS = re.search(two_num, GPS_input) # two number format

            if not temp_GPS: # unknown format
                if GPScol == 1:
                    lat = ""
                elif GPScol == 2:
                    lon = ""

            elif temp_GPS.group(2) == '.': # decimal degree
                if GPScol == 1:
                    lat = float(temp_GPS.group(1)) + (float(temp_GPS.group(3))/(10**len(temp_GPS.group(3))))
                elif GPScol == 2:
                    if float(temp_GPS.group(1)) > 0:
                        lon = -float(temp_GPS.group(1)) + (float(temp_GPS.group(3))/(10**len(temp_GPS.group(3))))
                    else:
                        lon = float(temp_GPS.group(1)) + (float(temp_GPS.group(3))/(10**len(temp_GPS.group(3))))

            elif GPScol == 1:
                lat = float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60
            elif GPScol == 2:
                if float(temp_GPS.group(1)) > 0:
                    lon = -(float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60)
                else:
                    lon = float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60

        elif GPScol == 1:
            lat = float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60 + float(temp_GPS.group(5)) / 3600
        elif GPScol == 2:
            if float(temp_GPS.group(1)) > 0:
                lon = -(float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60 + float(temp_GPS.group(5)) / 3600)
            else:
                lon = float(temp_GPS.group(1)) + float(temp_GPS.group(3)) / 60 + float(temp_GPS.group(5)) / 3600

    return [lat,lon]


def run(FILE):

    ### are you debuging? ###
    debug = False
    ###


    # dictionaries
    month_ref = {
        'Dec': 12, 'DEC': 12, 'dec': 12, 'december': 12, 'December': 12,
        'Nov': 11, 'NOV': 11, 'nov': 11, 'november': 11, 'November': 11,
        'Oct': 10, 'OCT': 10, 'oct': 10, 'october':  10, 'October':  10,
        'Sep':  9, 'SEP':  9, 'sep':  9, 'september': 9, 'September': 9,
        'Sept': 9, 'SEPT': 9, 'sept': 9,
        'Aug':  8, 'AUG':  8, 'aug':  8, 'august':    8, 'August':    8,
        'Jul':  7, 'JUL':  7, 'jul':  7, 'july':      7, 'July':      7,
        'Jun':  6, 'JUN':  6, 'jun':  6, 'june':      6, 'June':      6,
        'May':  5, 'MAY':  5, 'may':  5,
        'Apr':  4, 'APR':  4, 'apr':  4, 'april':     4, 'April':     4,
        'Mar':  3, 'MAR':  3, 'mar':  3, 'march':     3, 'March':     3,
        'Feb':  2, 'FEB':  2, 'feb':  2, 'february':  2, 'February':  2,
        'Jan':  1, 'JAN':  1, 'jan':  1, 'january':   1, 'January':   1}

    keys = ["dic_Location_State_Park_Name","dic_Season","dic_Year","dic_Month","dic_Day","dic_Rifle_range_number",
            "dic_Team_Members","dic_Transect_Name","dic_Transect_Description","dic_restored","dic_Compass_Bearing","dic_lat","dic_lon",
            "Abronia_latifolia", "Abronia_umbellata", "Achillea_millefolium",
            "Acmispon_glaber", "Acmispon_heermanii", "Acmispon_strigosus",
            "Ambrosia_chamissonis", "Ammophila_arenaria", "Amsinckia_spectabilis",
            "Anagallis_arevensis", "Anaphalis_margaritacea", "Annual_grasses",
            "Armeria_maritime_var__californica", "Artemisia_californica",
            "Artemisia_pycnocephalia", "Astragalus_nuttallii", "Atriplex_leucophylla",
            "Baccharis_pilularis", "Hirschfeldia_incana", "Bromus_diandrus", "Cakile_maritime",
            "Camissoniopsis_cheiranthifolia", "Camissoniopsis_micrantha", "Cardimine_oligosperma",
            "Cardionema_ramosissimum", "Carpobrotus_edulis", "Castilleja_latifolia",
            "Centaurea_solstitialis", "Cerastium_glomeratum", "Chenopodium_californicum",
            "Chorizanthe_pungens", "Claytonia_perfoliata", "Conicosia_pugioniformis",
            "Corethryogyne_filaginifolia", "Cortaderia_jubata", "Croton_californica",
            "Cryptantha_or_Plagiobothrys_sp__", "Daucus_pusillus", "Deinandra_corymbosa",
            "Dudleya_caespitosa", "Ericameria_ericoides", "Erigeron_canadensis",
            "Crassula_connata", "Erigeron_glaucus", "Eriogonum_latifolium",
            "Eriogonum_parvifolium", "Eriophyllum_staechadifolium", "Erodium_botrys",
            "Erodium_cicutarium", "Erysimum_ammophilum", "Erysimum_menziesii",
            "Eschscholzia_californica", "Frangula_californica", "Gilia_tenuiflora_ssp__arenaria",
            "Grindelia_latifolia", "Heterotheca_grandifolia", "Hypochaeris_glabra",
            "Logfia_gallica", "Lupinus_arboreas", "Lupinus_chamissonis",
            "Marah_fabacea", "Medicago_polymorpha", "Melilotis_indicus",
            "Micropus_californicus", "Minuartia_sp_", "Oxalis_pes_caprae",
            "Phacelia_ramosissima",
            "Plantago_coronopus", "Plantago_erecta", "Poa_douglasii",
            "Polygonum_paronychia", "Pseudognaphalium_californicum",
            "Pseudognaphalium_luteoalbum", "Pseudognaphalium_ramosissimum",
            "Pseudognaphalium_straminum", "Pterostegia_drymarodies", "Rumex_acetosella",
            "Senecio_vulgaris", "Silene_gallica", "Solanum_douglasii",
            "Solanum_umbelliferum", "Sonchus_sp__", "Stephanomeria_virgata","Stylocline_gnaphaloides",
            "Tetragonia_tetragonoides", "Toxicodendron_diversilobum", "Urtica_urens",
            "thatch","Bare_Ground", "Carpobrotus_edulis_thatch"
            ]
    misspelling = {
        "Thatch" : "thatch", "Dead_Thatch" :"thatch",
        "bareground": "Bare_Ground", "bare_ground": "Bare_Ground", "Bare_ground": "Bare_Ground", "bare_Ground": "Bare_Ground",
        "Bareground": "Bare_Ground",
        "carpobrotus_edulis_thatch": "Carpobrotus_edulis_thatch", "carpobrotus_edulis_Thatch": "Carpobrotus_edulis_thatch",
        "carpobrotus_Edulis_thatch": "Carpobrotus_edulis_thatch", "carpobrotus_Edulis_Thatch": "Carpobrotus_edulis_thatch",
        "Carpobrotus_edulis_thatch": "Carpobrotus_edulis_thatch", "Carpobrotus_edulis_Thatch": "Carpobrotus_edulis_thatch",
        "Carpobrotus_Edulis_thatch": "Carpobrotus_edulis_thatch", "Carpobrotus_Edulis_Thatch": "Carpobrotus_edulis_thatch",
        "Annual_Grass": "Annual_grasses"
    }
    formerly = {"Lessingia filaginifolia": "Corethryogyne filaginifolia",
                "Lotus stigosus": "Acmispon stigosus", "Rhamnus californica": "Frangula californica",
                "Filago gallica": "Logfia gallica",
                "Lotus scoparius": "Acmispon glaber",
                "Conyza canadensis": "Erigeron canadensis",
                "Camissonia cheiranthifolia": "Camissoniopsis cheiranthifolia",
                "Lotus heermanii": "Acmispon heermanii"
                }



    full_dict = dict.fromkeys(keys)
    for i in range(len(full_dict)):
        full_dict[keys[i]] = ""

    # initialize variables
    n = 0
    Location_State_Park_Name= ""
    Season = ""
    Year= ""
    Month= ""
    Day= ""
    Rifle_range_number= ""
    Team_Members= ""
    Transect_Name= ""
    Transect_Description= ""
    Compass_Bearing= ""
    lat= ""
    lon= ""
    x = ""

    # read in file
    obs = open(FILE,'r')
    for line in obs:
        n += 1
        New_line = ""

        # replace commas with pipes
        for i in line:
            if i == ",":
                New_line += "|"
            else:
                New_line += i

        line_list = New_line.rstrip('\r\n').split("\t")

        # if it's a metadata line...
        if n < 9:
            # see if it is not the gps line and ...
            # see if correct format (i.e. right cells)
            if line_list[0].split("/")[0] != 'Waypoint' and line_list[2] != "":
                if line_list[6] != "" and n >= 5 and line_list[6] not in ["total","Total"]:
                    x += "%s \t %s \t , %s \t %s," %(line_list[0],line_list[2],line_list[6],line_list[7])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," %(line_list[0],line_list[2])

            # metadata off but data correct (i.e. right cells)
            elif line_list[0].split("/")[0] != 'Waypoint' and line_list[1] != "":
                if line_list[6] != "" and n >= 5 and line_list[6] not in ["total","Total"]:
                    x += "%s \t %s \t , %s \t %s," %(line_list[0],line_list[1],line_list[6],line_list[7])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," %(line_list[0],line_list[1])

            # see if meta correct format data off (i.e. right cells)
            elif line_list[0].split("/")[0] != 'Waypoint' and line_list[2] != "" :
                if line_list[7] != "" and n >= 5 and line_list[7] not in ["total","Total"] and line_list[6] == "":
                    x += "%s \t %s \t , %s \t %s," %(line_list[0],line_list[2],line_list[7],line_list[8])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," %(line_list[0],line_list[2])

            # metadata off abd data off (i.e. right cells)
            elif line_list[0].split("/")[0] != 'Waypoint' and line_list[1] != "":
                if line_list[7] != "" and n >= 5 and line_list[7] not in ["total","Total"] and line_list[6] == "":
                    x += "%s \t %s \t , %s \t %s," %(line_list[0],line_list[1],line_list[7],line_list[8])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," %(line_list[0],line_list[1])


            # If it is a gps line...
            # see if it has a waypoint or a gap...
            elif line_list[2] == "" or line_list[0] in ["W","w"]:
                if n >= 5 and line_list[6] not in ["total","Total",""]:
                    x += "%s \t %s \t %s , %s \t %s," %(line_list[0],line_list[3],line_list[4],line_list[6],line_list[7])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," %(line_list[0],line_list[2])

            # if not it is formatted correctly (i.e. right cells)
            else:
                if line_list[6] != "" and n >= 5 and line_list[6] not in ["total", "Total"]:
                    x += "%s \t %s \t %s , %s \t %s," % (line_list[0], line_list[2], line_list[3], line_list[6], line_list[7])
                    if len(line_list) > 9:
                        x += "%s \t 0," % (line_list[9])
                else:
                    x += "%s \t %s \t ," % (line_list[0], line_list[2])




        # if the summary data is here properly and past all metadata
        elif line_list[6] not in ["total","Total",""]:
                x += "%s \t %s ," %(line_list[6],line_list[7])

                if len(line_list) > 9:
                    x += "%s \t 0," % (line_list[9])
        elif line_list[6] == "":
            x += "%s \t %s ," % (line_list[7], line_list[8])

            if len(line_list) > 10:
                x += "%s \t 0," % (line_list[10])

        else:
            break

    metaANDdata = StoDandM(x)

    # set all the easy ones
    Location_State_Park_Name = metaANDdata[0][0][1]
    Rifle_range_number = metaANDdata[0][2][1].lstrip(" #")
    Team_Members = metaANDdata[0][3][1].replace('|', ',')
    Transect_Name = metaANDdata[0][4][1].replace('|', ',')
    Transect_Description =metaANDdata[0][5][1].replace('|', ',')

    # determine which format the date was entered in
    date_str_fixed = metaANDdata[0][1][1].replace("|","").replace(".","").lstrip(" ").rstrip(" ")

    date_gate = gate_calc(date_str_fixed)
    if debug :
        print date_gate

    try:
        # figure out to split the date and handle each of the different date formats
        # by separating day, month, and year
        if date_gate == "text":
            date_list_temp = date_str_fixed.split(" ")

            try:
                Day = int(date_list_temp[0])
                Month = month_ref[date_list_temp[1]]
                try:
                    if len(date_list_temp[2]) > 2:
                        Year = date_list_temp[2]
                    else:
                        Year = "20" + date_list_temp[2]
                except:
                    Year = ""
            except:
                Day = int(date_list_temp[1])
                Month = month_ref[date_list_temp[0]]
                try:
                    if len(date_list_temp[2]) > 2:
                        Year = date_list_temp[2]
                    else:
                        Year = "20" + date_list_temp[2]
                except:
                    Year = ""
        elif date_gate == "slash":
            date_list_temp = date_str_fixed.split("/")
            Day = int(date_list_temp[1])
            Month = date_list_temp[0]
            try:
                if len(date_list_temp[2]) > 2:
                    Year = date_list_temp[2]
                else:
                    Year = "20" + date_list_temp[2]
            except:
                Year = ""
        elif date_gate == "dash":
            date_list_temp = date_str_fixed.split("-")
            Day = int(date_list_temp[1])
            Month = date_list_temp[0]
            try:
                if len(date_list_temp[2]) > 2:
                    Year = date_list_temp[2]
                else:
                    Year = "20" + date_list_temp[2]
            except:
                Year = ""
        elif date_gate == "removal":
            date_list_temp = date_str_fixed.split("-")
            Year = date_list_temp[0]
            Month = date_list_temp[1]
            Day = date_list_temp[2].split(" ")[0]
    except:
        Year = ""
        Day = ""
        Month = ""

    # set Season variable according to Month
    if Month >= 6:
        Season = "Fall"
    elif Month <= 7:
        Season = "Spring"
    else:
        Season = "Unknown"

    # fix compass
    for chr in metaANDdata[0][6][1].lstrip(" "):
            if chr.isdigit():
                Compass_Bearing += chr
            else: break

    # save fixed GPS data
    latlon = fixGPS(metaANDdata[0][7])

#    print metaANDdata[0]
#    print metaANDdata[1]



    #  put the data into the dictionary
    for j in range(0,len(metaANDdata[1])-1,1):
        fixed_key = metaANDdata[1][j][0].split('(')[0].rstrip(' ').lstrip(' ').replace(' ','_').replace('.','_')\
            .replace('-','_').replace('|','_')

        # see if everything is fine in the key then use the dic setting "seen in 250m" to zero if it was null
        if fixed_key in keys:
            if metaANDdata[1][j][1] != "":
                full_dict[fixed_key] = int(metaANDdata[1][j][1].lstrip(" ").rstrip(" "))
            elif full_dict[fixed_key] != "":
                full_dict[fixed_key] = 0

        # see if they misspelled or strangely capitalized keys
        # fix that then use the dic setting "seen in 250m" to zero if it was null
        elif fixed_key in misspelling:
            if metaANDdata[1][j][1] != "" or int(metaANDdata[1][j][1]) == 0:
                full_dict[misspelling[fixed_key]] = int(metaANDdata[1][j][1].lstrip(" ").rstrip(" "))
            elif full_dict[misspelling[fixed_key]] == "":
                full_dict[misspelling[fixed_key]] = 0

        # see if it is the old name then fix that then use the dic setting "seen in 250m" to zero if it was null
        elif fixed_key in formerly:
            if metaANDdata[1][j][1] != "" or int(metaANDdata[1][j][1]) == 0:
                full_dict[misspelling[fixed_key]] = int(metaANDdata[1][j][1].lstrip(" ").rstrip(" "))
            elif full_dict[misspelling[fixed_key]] == "":
                full_dict[misspelling[fixed_key]] = 0

        # if not it is a nice case and we will have to potentially update data manually so print out key and val to
        # the terminal as an error
        elif fixed_key not in  [""," ","\t","   ","    "]:
            stderr = ""
            stderr = " %s ask is %s = %d a valid key?\n" % (Team_Members,fixed_key,int(metaANDdata[1][j][1].lstrip(" ").rstrip(" ")))
            sys.stderr.write(stderr)

    # set fixed metadata values into dictionary
    full_dict["dic_Location_State_Park_Name"] = Location_State_Park_Name
    full_dict["dic_Season"] = Season
    full_dict["dic_Year"] = Year
    full_dict["dic_Month"] = Month
    full_dict["dic_Day"] = Day
    full_dict["dic_Rifle_range_number"] = Rifle_range_number
    full_dict["dic_Team_Members"] = Team_Members
    full_dict["dic_Transect_Name"]= Transect_Name
    full_dict["dic_Transect_Description"]=  Transect_Description
    full_dict["dic_Compass_Bearing"]= Compass_Bearing
    full_dict["dic_lat"]= latlon[0]
    full_dict["dic_lon"]= latlon[1]





    # define a dic values list
    dict_values = []
    for j in range(len(keys)):
        dict_values.append(full_dict[keys[j]])

    for z in range(0,len(keys)-12,1):
        if full_dict[keys[z+12]] == "":
            dict_values.append(0)
        else:
            dict_values.append("1")

    out_string = "%s\t" * (len(dict_values))
    # print the transect out as an individual line
    return out_string % tuple(dict_values)

if __name__ == '__main__':
    main()
