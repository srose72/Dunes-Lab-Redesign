#Uses dune_lab as active database
USE dune_lab;

#Turn off safe updates
 SET SQL_SAFE_UPDATES = 0;
 
#Load data into temp table
#Note, you will need to update the below file path to the correct one for your computer. To do this, find the folder the temp.tsv is stored in, and copy and paste the file path in between the
#single quotation marks, replacing all forward slashes (\) with back slashes (/).
LOAD DATA LOCAL INFILE '/Users/zanetoyon/Desktop/Dune_Lab/temp.tsv' INTO TABLE temp FIELDS TERMINATED BY '	' (location, Season, year, month, day, rifle_range, team_members, transect_name, transect_descr, restored, compass_bearing, lat, lon, 
Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, Acmispon_heermanii, 
Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, Anagallis_arevensis, 
Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, Artemisia_pycnocephalia, 
Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, Bromus_diandrus, 
Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis, 
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
Abronia__latifolia, Abronia__umbellata, Achillea__millefolium, Acmispon__glaber, Acmispon__heermanii, 
Acmispon__strigosus, Ambrosia__chamissonis, Ammophila__arenaria, Amsinckia__spectabilis, Anagallis__arevensis, 
Anaphalis__margaritacea, Annual__grasses, Armeria__maritime__var____californica, Artemisia__californica, Artemisia__pycnocephalia, 
Astragalus__nuttallii, Atriplex__leucophylla, Baccharis__pilularis, Hirschfeldia__incana, Bromus__diandrus, 
Cakile__maritime, Camissoniopsis__cheiranthifolia, Camissoniopsis__micrantha, Cardimine__oligosperma, 
Cardionema__ramosissimum, Carpobrotus__edulis, Castilleja__latifolia, Centaurea__solstitialis, Cerastium__glomeratum__, 
Chenopodium__californicum, Chorizanthe__pungens, Claytonia__perfoliata, Conicosia__pugioniformis, Corethryogyne__filaginifolia, 
Cortaderia__jubata, Croton__californica, Cryptantha__or__Plagiobothrys__sp__, Daucus__pusillus, Deinandra__corymbosa, 
Dudleya__caespitosa, Ericameria__ericoides, Erigeron__canadensis, Crassula__connata, Erigeron__glaucus, 
Eriogonum__latifolium, Eriogonum__parvifolium, Eriophyllum__staechadifolium, Erodium__botrys, Erodium__cicutarium, 
Erysimum__ammophilum, Erysimum__menziesii, Eschscholzia__californica, Frangula__californica, Gilia__tenuiflora__ssp____arenaria, 
Grindelia__latifolia, Heterotheca__grandifolia, Hypochaeris__glabra, Logfia__gallica, Lupinus__arboreas, 
Lupinus__chamissonis, Marah__fabacea, Medicago__polymorpha, Melilotis__indicus, Micropus__californicus, 
Minuartia__sp__, Oxalis__pes__caprae, Phacelia__ramosissima, Plantago__coronopus, Plantago__erecta, 
Poa__douglasii, Polygonum__paronychia, Pseudognaphalium__californicum__, Pseudognaphalium__luteoalbum, Pseudognaphalium__ramosissimum, 
Pseudognaphalium__straminum, Pterostegia__drymaroides, Rumex__acetosella, Senecio__vulgaris, Silene__gallica, 
Solanum__douglasii, Solanum__umbelliferum, Sonchus__sp__, Stephanomeria__virgata, Stylocline__gnaphaloides, 
Tetragonia__tetragonoides, Toxicodendron__diversilobum, Urtica__urens, Thatch_, Bare__Ground, Thatch__Carpobrotus__edulis);
#If any new species are added, at the end of the above line and replace any spaces or special characters with two underscores (doubled from the first part of this statement)

#Move relevant data from temp into frequency
INSERT INTO frequency 
(Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, Acmispon_heermanii, 
Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, Anagallis_arevensis, 
Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, Artemisia_pycnocephalia, 
Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, Bromus_diandrus, 
Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis)
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
SELECT temp.Abronia_latifolia, temp.Abronia_umbellata, temp.Achillea_millefolium, temp.Acmispon_glaber, temp.Acmispon_heermanii, 
temp.Acmispon_strigosus, temp.Ambrosia_chamissonis, temp.Ammophila_arenaria, temp.Amsinckia_spectabilis, temp.Anagallis_arevensis, 
temp.Anaphalis_margaritacea, temp.Annual_grasses, Armeria_maritime_var__californica, temp.Artemisia_californica, temp.Artemisia_pycnocephalia, 
temp.Astragalus_nuttallii, temp.Atriplex_leucophylla, temp.Baccharis_pilularis, temp.Hirschfeldia_incana, temp.Bromus_diandrus, 
temp.Cakile_maritime, temp.Camissoniopsis_cheiranthifolia, temp.Camissoniopsis_micrantha, temp.Cardimine_oligosperma, temp.Cardionema_ramosissimum, 
temp.Carpobrotus_edulis, temp.Castilleja_latifolia, temp.Centaurea_solstitialis, temp.Cerastium_glomeratum_, temp.Chenopodium_californicum, 
temp.Chorizanthe_pungens, temp.Claytonia_perfoliata, temp.Conicosia_pugioniformis, temp.Corethryogyne_filaginifolia, 
temp.Cortaderia_jubata, temp.Croton_californica, temp.Cryptantha_or_Plagiobothrys_sp_, temp.Daucus_pusillus, temp.Deinandra_corymbosa, 
temp.Dudleya_caespitosa, temp.Ericameria_ericoides, temp.Erigeron_canadensis, temp.Crassula_connata, temp.Erigeron_glaucus, 
temp.Eriogonum_latifolium, temp.Eriogonum_parvifolium, temp.Eriophyllum_staechadifolium, temp.Erodium_botrys, temp.Erodium_cicutarium, 
temp.Erysimum_ammophilum, temp.Erysimum_menziesii, temp.Eschscholzia_californica, temp.Frangula_californica, temp.Gilia_tenuiflora_ssp__arenaria, 
temp.Grindelia_latifolia, temp.Heterotheca_grandifolia, temp.Hypochaeris_glabra, temp.Logfia_gallica, temp.Lupinus_arboreas, 
temp.Lupinus_chamissonis, temp.Marah_fabacea, temp.Medicago_polymorpha, temp.Melilotis_indicus, temp.Micropus_californicus, 
temp.Minuartia_sp_, temp.Oxalis_pes_caprae, temp.Phacelia_ramosissima, temp.Plantago_coronopus, temp.Plantago_erecta, 
temp.Poa_douglasii, temp.Polygonum_paronychia, temp.Pseudognaphalium_californicum_, temp.Pseudognaphalium_luteoalbum, temp.Pseudognaphalium_ramosissimum, 
temp.Pseudognaphalium_straminum, temp.Pterostegia_drymaroides, temp.Rumex_acetosella, temp.Senecio_vulgaris, temp.Silene_gallica, 
temp.Solanum_douglasii, temp.Solanum_umbelliferum, temp.Sonchus_sp_, temp.Stephanomeria_virgata, temp.Stylocline_gnaphaloides, 
temp.Tetragonia_tetragonoides, temp.Toxicodendron_diversilobum, temp.Urtica_urens, temp.Thatch, temp.Bare_Ground, temp.Thatch_Carpobrotus_edulis 
#If any new species are added, at the end of the above line replacing any spaces or special characters with underscores and add temp. at the beginning of the species name
FROM temp;

#Removes duplicate rows from frequency table
DELETE frequency FROM frequency 
LEFT OUTER JOIN (
SELECT MIN(frequency_id) AS frequency_id, Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber,
Acmispon_heermanii, Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, 
Anagallis_arevensis, Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, 
Artemisia_pycnocephalia, Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, 
Bromus_diandrus, Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis 
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
FROM frequency 
GROUP BY Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, 
Acmispon_heermanii, Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, 
Anagallis_arevensis, Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, 
Artemisia_pycnocephalia, Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, 
Bromus_diandrus, Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
) AS KEEPROWS ON
frequency.frequency_id = KEEPROWS.frequency_id
WHERE KEEPROWS.frequency_id IS NULL;

#Insert boolean data into observed table from temp.alter
INSERT INTO obs (
Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, Acmispon_heermanii, 
Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, Anagallis_arevensis, 
Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, Artemisia_pycnocephalia, 
Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, Bromus_diandrus, 
Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis)
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
SELECT temp.Abronia__latifolia, temp.Abronia__umbellata, temp.Achillea__millefolium, temp.Acmispon__glaber, temp.Acmispon__heermanii, 
temp.Acmispon__strigosus, temp.Ambrosia__chamissonis, temp.Ammophila__arenaria, temp.Amsinckia__spectabilis, temp.Anagallis__arevensis, 
temp.Anaphalis__margaritacea, temp.Annual__grasses, Armeria__maritime__var____californica, temp.Artemisia__californica, temp.Artemisia__pycnocephalia, 
temp.Astragalus__nuttallii, temp.Atriplex__leucophylla, temp.Baccharis__pilularis, temp.Hirschfeldia__incana, temp.Bromus__diandrus, 
temp.Cakile__maritime, temp.Camissoniopsis__cheiranthifolia, temp.Camissoniopsis__micrantha, temp.Cardimine__oligosperma, 
temp.Cardionema__ramosissimum, temp.Carpobrotus__edulis, temp.Castilleja__latifolia, temp.Centaurea__solstitialis, temp.Cerastium__glomeratum__, 
temp.Chenopodium__californicum, temp.Chorizanthe__pungens, temp.Claytonia__perfoliata, temp.Conicosia__pugioniformis, temp.Corethryogyne__filaginifolia, 
temp.Cortaderia__jubata, temp.Croton__californica, temp.Cryptantha__or__Plagiobothrys__sp__, temp.Daucus__pusillus, temp.Deinandra__corymbosa, 
temp.Dudleya__caespitosa, temp.Ericameria__ericoides, temp.Erigeron__canadensis, temp.Crassula__connata, temp.Erigeron__glaucus, 
temp.Eriogonum__latifolium, temp.Eriogonum__parvifolium, temp.Eriophyllum__staechadifolium, temp.Erodium__botrys, temp.Erodium__cicutarium, 
temp.Erysimum__ammophilum, temp.Erysimum__menziesii, temp.Eschscholzia__californica, temp.Frangula__californica, temp.Gilia__tenuiflora__ssp____arenaria, 
temp.Grindelia__latifolia, temp.Heterotheca__grandifolia, temp.Hypochaeris__glabra, temp.Logfia__gallica, temp.Lupinus__arboreas, 
temp.Lupinus__chamissonis, temp.Marah__fabacea, temp.Medicago__polymorpha, temp.Melilotis__indicus, temp.Micropus__californicus, 
temp.Minuartia__sp__, temp.Oxalis__pes__caprae, temp.Phacelia__ramosissima, temp.Plantago__coronopus, temp.Plantago__erecta, 
temp.Poa__douglasii, temp.Polygonum__paronychia, temp.Pseudognaphalium__californicum__, temp.Pseudognaphalium__luteoalbum, temp.Pseudognaphalium__ramosissimum, 
temp.Pseudognaphalium__straminum, temp.Pterostegia__drymaroides, temp.Rumex__acetosella, temp.Senecio__vulgaris, temp.Silene__gallica, 
temp.Solanum__douglasii, temp.Solanum__umbelliferum, temp.Sonchus__sp__, temp.Stephanomeria__virgata, temp.Stylocline__gnaphaloides, 
temp.Tetragonia__tetragonoides, temp.Toxicodendron__diversilobum, temp.Urtica__urens, temp.Thatch_, temp.Bare__Ground, temp.Thatch__Carpobrotus__edulis 
#If any new species are added, at the end of the above line and replace any spaces or special characters with two underscores (double the above statement)
FROM temp;

#Removes Duplicates from obs table
DELETE obs FROM obs 
LEFT OUTER JOIN (
SELECT MIN(obs_id) AS obs_id, Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, Acmispon_heermanii, 
Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, Anagallis_arevensis, 
Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, Artemisia_pycnocephalia, 
Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, Bromus_diandrus, 
Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis 
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
FROM obs 
GROUP BY Abronia_latifolia, Abronia_umbellata, Achillea_millefolium, Acmispon_glaber, Acmispon_heermanii, 
Acmispon_strigosus, Ambrosia_chamissonis, Ammophila_arenaria, Amsinckia_spectabilis, Anagallis_arevensis, 
Anaphalis_margaritacea, Annual_grasses, Armeria_maritime_var__californica, Artemisia_californica, Artemisia_pycnocephalia, 
Astragalus_nuttallii, Atriplex_leucophylla, Baccharis_pilularis, Hirschfeldia_incana, Bromus_diandrus, 
Cakile_maritime, Camissoniopsis_cheiranthifolia, Camissoniopsis_micrantha, Cardimine_oligosperma, 
Cardionema_ramosissimum, Carpobrotus_edulis, Castilleja_latifolia, Centaurea_solstitialis, Cerastium_glomeratum_, 
Chenopodium_californicum, Chorizanthe_pungens, Claytonia_perfoliata, Conicosia_pugioniformis, Corethryogyne_filaginifolia, 
Cortaderia_jubata, Croton_californica, Cryptantha_or_Plagiobothrys_sp_, Daucus_pusillus, Deinandra_corymbosa, 
Dudleya_caespitosa, Ericameria_ericoides, Erigeron_canadensis, Crassula_connata, Erigeron_glaucus, 
Eriogonum_latifolium, Eriogonum_parvifolium, Eriophyllum_staechadifolium, Erodium_botrys, Erodium_cicutarium, 
Erysimum_ammophilum, Erysimum_menziesii, Eschscholzia_californica, Frangula_californica, Gilia_tenuiflora_ssp__arenaria, 
Grindelia_latifolia, Heterotheca_grandifolia, Hypochaeris_glabra, Logfia_gallica, Lupinus_arboreas, 
Lupinus_chamissonis, Marah_fabacea, Medicago_polymorpha, Melilotis_indicus, Micropus_californicus, 
Minuartia_sp_, Oxalis_pes_caprae, Phacelia_ramosissima, Plantago_coronopus, Plantago_erecta, 
Poa_douglasii, Polygonum_paronychia, Pseudognaphalium_californicum_, Pseudognaphalium_luteoalbum, Pseudognaphalium_ramosissimum, 
Pseudognaphalium_straminum, Pterostegia_drymaroides, Rumex_acetosella, Senecio_vulgaris, Silene_gallica, 
Solanum_douglasii, Solanum_umbelliferum, Sonchus_sp_, Stephanomeria_virgata, Stylocline_gnaphaloides, 
Tetragonia_tetragonoides, Toxicodendron_diversilobum, Urtica_urens, Thatch, Bare_Ground, Thatch_Carpobrotus_edulis
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores
) AS KeepRows ON
obs.obs_id = KeepRows.obs_id
WHERE KeepRows.obs_id IS NULL;

#Insert metadata and foreign keys into metadata table from temp table, while allowing for duplicates of metadata
INSERT INTO metadata(location, Season, year, month, day, rifle_range, team_members, transect_name, transect_descr, restored, compass_bearing, lat, lon, frequency_id, obs_id)
(SELECT c1.location, c1.year, c1.month, c1.day,c1.rifle_range, c1.team_members, c1.transect_name, c1.transect_descr, c1.restored, c1.compass_bearing, c1.lat, c1.lon, frequency_id, obs_id FROM
(SELECT temp.location, temp.Season, temp.year, temp.month, temp.day, temp.rifle_range, temp.team_members, temp.transect_name, temp.transect_descr, temp.restored, temp.compass_bearing, temp.lat, temp.lon,frequency.frequency_id FROM frequency, temp WHERE (
temp.Abronia_latifolia=frequency.Abronia_latifolia AND
temp.Abronia_umbellata=frequency.Abronia_umbellata AND
temp.Achillea_millefolium=frequency.Achillea_millefolium AND
temp.Acmispon_glaber=frequency.Acmispon_glaber AND
temp.Acmispon_heermanii=frequency.Acmispon_heermanii AND
temp.Acmispon_strigosus=frequency.Acmispon_strigosus AND
temp.Ambrosia_chamissonis=frequency.Ambrosia_chamissonis AND
temp.Ammophila_arenaria=frequency.Ammophila_arenaria AND
temp.Amsinckia_spectabilis=frequency.Amsinckia_spectabilis AND
temp.Anagallis_arevensis=frequency.Anagallis_arevensis AND
temp.Anaphalis_margaritacea=frequency.Anaphalis_margaritacea AND
temp.Annual_grasses=frequency.Annual_grasses AND
temp.Armeria_maritime_var__californica=frequency.Armeria_maritime_var__californica AND
temp.Artemisia_californica=frequency.Artemisia_californica AND
temp.Artemisia_pycnocephalia=frequency.Artemisia_pycnocephalia AND
temp.Astragalus_nuttallii=frequency.Astragalus_nuttallii AND
temp.Atriplex_leucophylla=frequency.Atriplex_leucophylla AND
temp.Baccharis_pilularis=frequency.Baccharis_pilularis AND
temp.Hirschfeldia_incana=frequency.Hirschfeldia_incana AND
temp.Bromus_diandrus=frequency.Bromus_diandrus AND
temp.Cakile_maritime=frequency.Cakile_maritime AND
temp.Camissoniopsis_cheiranthifolia=frequency.Camissoniopsis_cheiranthifolia AND
temp.Camissoniopsis_micrantha=frequency.Camissoniopsis_micrantha AND
temp.Cardimine_oligosperma=frequency.Cardimine_oligosperma AND
temp.Cardionema_ramosissimum=frequency.Cardionema_ramosissimum AND
temp.Carpobrotus_edulis=frequency.Carpobrotus_edulis AND
temp.Castilleja_latifolia=frequency.Castilleja_latifolia AND
temp.Centaurea_solstitialis=frequency.Centaurea_solstitialis AND
temp.Cerastium_glomeratum_=frequency.Cerastium_glomeratum_ AND
temp.Chenopodium_californicum=frequency.Chenopodium_californicum AND
temp.Chorizanthe_pungens=frequency.Chorizanthe_pungens AND
temp.Claytonia_perfoliata=frequency.Claytonia_perfoliata AND
temp.Conicosia_pugioniformis=frequency.Conicosia_pugioniformis AND
temp.Corethryogyne_filaginifolia=frequency.Corethryogyne_filaginifolia AND
temp.Cortaderia_jubata=frequency.Cortaderia_jubata AND
temp.Croton_californica=frequency.Croton_californica AND
temp.Cryptantha_or_Plagiobothrys_sp_=frequency.Cryptantha_or_Plagiobothrys_sp_ AND
temp.Daucus_pusillus=frequency.Daucus_pusillus AND
temp.Deinandra_corymbosa=frequency.Deinandra_corymbosa AND
temp.Dudleya_caespitosa=frequency.Dudleya_caespitosa AND
temp.Ericameria_ericoides=frequency.Ericameria_ericoides AND
temp.Erigeron_canadensis=frequency.Erigeron_canadensis AND
temp.Crassula_connata=frequency.Crassula_connata AND
temp.Erigeron_glaucus=frequency.Erigeron_glaucus AND
temp.Eriogonum_latifolium=frequency.Eriogonum_latifolium AND
temp.Eriogonum_parvifolium=frequency.Eriogonum_parvifolium AND
temp.Eriophyllum_staechadifolium=frequency.Eriophyllum_staechadifolium AND
temp.Erodium_botrys=frequency.Erodium_botrys AND
temp.Erodium_cicutarium=frequency.Erodium_cicutarium AND
temp.Erysimum_ammophilum=frequency.Erysimum_ammophilum AND
temp.Erysimum_menziesii=frequency.Erysimum_menziesii AND
temp.Eschscholzia_californica=frequency.Eschscholzia_californica AND
temp.Frangula_californica=frequency.Frangula_californica AND
temp.Gilia_tenuiflora_ssp__arenaria=frequency.Gilia_tenuiflora_ssp__arenaria AND
temp.Grindelia_latifolia=frequency.Grindelia_latifolia AND
temp.Heterotheca_grandifolia=frequency.Heterotheca_grandifolia AND
temp.Hypochaeris_glabra=frequency.Hypochaeris_glabra AND
temp.Logfia_gallica=frequency.Logfia_gallica AND
temp.Lupinus_arboreas=frequency.Lupinus_arboreas AND
temp.Lupinus_chamissonis=frequency.Lupinus_chamissonis AND
temp.Marah_fabacea=frequency.Marah_fabacea AND
temp.Medicago_polymorpha=frequency.Medicago_polymorpha AND
temp.Melilotis_indicus=frequency.Melilotis_indicus AND
temp.Micropus_californicus=frequency.Micropus_californicus AND
temp.Minuartia_sp_=frequency.Minuartia_sp_ AND
temp.Oxalis_pes_caprae=frequency.Oxalis_pes_caprae AND
temp.Phacelia_ramosissima=frequency.Phacelia_ramosissima AND
temp.Plantago_coronopus=frequency.Plantago_coronopus AND
temp.Plantago_erecta=frequency.Plantago_erecta AND
temp.Poa_douglasii=frequency.Poa_douglasii AND
temp.Polygonum_paronychia=frequency.Polygonum_paronychia AND
temp.Pseudognaphalium_californicum_=frequency.Pseudognaphalium_californicum_ AND
temp.Pseudognaphalium_luteoalbum=frequency.Pseudognaphalium_luteoalbum AND
temp.Pseudognaphalium_ramosissimum=frequency.Pseudognaphalium_ramosissimum AND
temp.Pseudognaphalium_straminum=frequency.Pseudognaphalium_straminum AND
temp.Pterostegia_drymaroides=frequency.Pterostegia_drymaroides AND
temp.Rumex_acetosella=frequency.Rumex_acetosella AND
temp.Senecio_vulgaris=frequency.Senecio_vulgaris AND
temp.Silene_gallica=frequency.Silene_gallica AND
temp.Solanum_douglasii=frequency.Solanum_douglasii AND
temp.Solanum_umbelliferum=frequency.Solanum_umbelliferum AND
temp.Sonchus_sp_=frequency.Sonchus_sp_ AND
temp.Stephanomeria_virgata=frequency.Stephanomeria_virgata AND
temp.Stylocline_gnaphaloides=frequency.Stylocline_gnaphaloides AND
temp.Tetragonia_tetragonoides=frequency.Tetragonia_tetragonoides AND
temp.Toxicodendron_diversilobum=frequency.Toxicodendron_diversilobum AND
temp.Urtica_urens=frequency.Urtica_urens AND
temp.Thatch=frequency.Thatch AND
temp.Bare_Ground=frequency.Bare_Ground AND
temp.Thatch_Carpobrotus_edulis=frequency.Thatch_Carpobrotus_edulis 
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores keeping with the formatting of each line above (temp.Genus_species=frequency.Genus_species)
)) AS c1
JOIN
(SELECT temp.location, temp.Season, temp.year, temp.month, temp.day, temp.rifle_range, temp.team_members, temp.transect_name, temp.transect_descr, temp.restored, temp.compass_bearing, temp.lat, temp.lon,obs.obs_id  FROM obs, temp WHERE (
temp.Abronia__latifolia=obs.Abronia_latifolia AND
temp.Abronia__umbellata=obs.Abronia_umbellata AND
temp.Achillea__millefolium=obs.Achillea_millefolium AND
temp.Acmispon__glaber=obs.Acmispon_glaber AND
temp.Acmispon__heermanii=obs.Acmispon_heermanii AND
temp.Acmispon__strigosus=obs.Acmispon_strigosus AND
temp.Ambrosia__chamissonis=obs.Ambrosia_chamissonis AND
temp.Ammophila__arenaria=obs.Ammophila_arenaria AND
temp.Amsinckia__spectabilis=obs.Amsinckia_spectabilis AND
temp.Anagallis__arevensis=obs.Anagallis_arevensis AND
temp.Anaphalis__margaritacea=obs.Anaphalis_margaritacea AND
temp.Annual__grasses=obs.Annual_grasses AND
temp.Armeria__maritime__var____californica=obs.Armeria_maritime_var__californica AND
temp.Artemisia__californica=obs.Artemisia_californica AND
temp.Artemisia__pycnocephalia=obs.Artemisia_pycnocephalia AND
temp.Astragalus__nuttallii=obs.Astragalus_nuttallii AND
temp.Atriplex__leucophylla=obs.Atriplex_leucophylla AND
temp.Baccharis__pilularis=obs.Baccharis_pilularis AND
temp.Hirschfeldia__incana=obs.Hirschfeldia_incana AND
temp.Bromus__diandrus=obs.Bromus_diandrus AND
temp.Cakile__maritime=obs.Cakile_maritime AND
temp.Camissoniopsis__cheiranthifolia=obs.Camissoniopsis_cheiranthifolia AND
temp.Camissoniopsis__micrantha=obs.Camissoniopsis_micrantha AND
temp.Cardimine__oligosperma=obs.Cardimine_oligosperma AND
temp.Cardionema__ramosissimum=obs.Cardionema_ramosissimum AND
temp.Carpobrotus__edulis=obs.Carpobrotus_edulis AND
temp.Castilleja__latifolia=obs.Castilleja_latifolia AND
temp.Centaurea__solstitialis=obs.Centaurea_solstitialis AND
temp.Cerastium__glomeratum__=obs.Cerastium_glomeratum_ AND
temp.Chenopodium__californicum=obs.Chenopodium_californicum AND
temp.Chorizanthe__pungens=obs.Chorizanthe_pungens AND
temp.Claytonia__perfoliata=obs.Claytonia_perfoliata AND
temp.Conicosia__pugioniformis=obs.Conicosia_pugioniformis AND
temp.Corethryogyne__filaginifolia=obs.Corethryogyne_filaginifolia AND
temp.Cortaderia__jubata=obs.Cortaderia_jubata AND
temp.Croton__californica=obs.Croton_californica AND
temp.Cryptantha__or__Plagiobothrys__sp__=obs.Cryptantha_or_Plagiobothrys_sp_ AND
temp.Daucus__pusillus=obs.Daucus_pusillus AND
temp.Deinandra__corymbosa=obs.Deinandra_corymbosa AND
temp.Dudleya__caespitosa=obs.Dudleya_caespitosa AND
temp.Ericameria__ericoides=obs.Ericameria_ericoides AND
temp.Erigeron__canadensis=obs.Erigeron_canadensis AND
temp.Crassula__connata=obs.Crassula_connata AND
temp.Erigeron__glaucus=obs.Erigeron_glaucus AND
temp.Eriogonum__latifolium=obs.Eriogonum_latifolium AND
temp.Eriogonum__parvifolium=obs.Eriogonum_parvifolium AND
temp.Eriophyllum__staechadifolium=obs.Eriophyllum_staechadifolium AND
temp.Erodium__botrys=obs.Erodium_botrys AND
temp.Erodium__cicutarium=obs.Erodium_cicutarium AND
temp.Erysimum__ammophilum=obs.Erysimum_ammophilum AND
temp.Erysimum__menziesii=obs.Erysimum_menziesii AND
temp.Eschscholzia__californica=obs.Eschscholzia_californica AND
temp.Frangula__californica=obs.Frangula_californica AND
temp.Gilia__tenuiflora__ssp____arenaria=obs.Gilia_tenuiflora_ssp__arenaria AND
temp.Grindelia__latifolia=obs.Grindelia_latifolia AND
temp.Heterotheca__grandifolia=obs.Heterotheca_grandifolia AND
temp.Hypochaeris__glabra=obs.Hypochaeris_glabra AND
temp.Logfia__gallica=obs.Logfia_gallica AND
temp.Lupinus__arboreas=obs.Lupinus_arboreas AND
temp.Lupinus__chamissonis=obs.Lupinus_chamissonis AND
temp.Marah__fabacea=obs.Marah_fabacea AND
temp.Medicago__polymorpha=obs.Medicago_polymorpha AND
temp.Melilotis__indicus=obs.Melilotis_indicus AND
temp.Micropus__californicus=obs.Micropus_californicus AND
temp.Minuartia__sp__=obs.Minuartia_sp_ AND
temp.Oxalis__pes__caprae=obs.Oxalis_pes_caprae AND
temp.Phacelia__ramosissima=obs.Phacelia_ramosissima AND
temp.Plantago__coronopus=obs.Plantago_coronopus AND
temp.Plantago__erecta=obs.Plantago_erecta AND
temp.Poa__douglasii=obs.Poa_douglasii AND
temp.Polygonum__paronychia=obs.Polygonum_paronychia AND
temp.Pseudognaphalium__californicum__=obs.Pseudognaphalium_californicum_ AND
temp.Pseudognaphalium__luteoalbum=obs.Pseudognaphalium_luteoalbum AND
temp.Pseudognaphalium__ramosissimum=obs.Pseudognaphalium_ramosissimum AND
temp.Pseudognaphalium__straminum=obs.Pseudognaphalium_straminum AND
temp.Pterostegia__drymaroides=obs.Pterostegia_drymaroides AND
temp.Rumex__acetosella=obs.Rumex_acetosella AND
temp.Senecio__vulgaris=obs.Senecio_vulgaris AND
temp.Silene__gallica=obs.Silene_gallica AND
temp.Solanum__douglasii=obs.Solanum_douglasii AND
temp.Solanum__umbelliferum=obs.Solanum_umbelliferum AND
temp.Sonchus__sp__=obs.Sonchus_sp_ AND
temp.Stephanomeria__virgata=obs.Stephanomeria_virgata AND
temp.Stylocline__gnaphaloides=obs.Stylocline_gnaphaloides AND
temp.Tetragonia__tetragonoides=obs.Tetragonia_tetragonoides AND
temp.Toxicodendron__diversilobum=obs.Toxicodendron_diversilobum AND
temp.Urtica__urens=obs.Urtica_urens AND
temp.Thatch_=obs.thatch AND
temp.Bare__Ground=obs.Bare_Ground AND
temp.Thatch__Carpobrotus__edulis=obs.Thatch_Carpobrotus_edulis)) 
#If any new species are added, at the end of the above line and replace any spaces or special characters with underscores keeping with the formatting of each line above (temp.Genus__species=frequency.Genus_species)
AS c2

on
 c1.location=c2.location AND
 c1.Season=c2.Season AND
 c1.year=c2.year AND
 c1.month=c2.month AND
 c1.day=c2.day AND
 c1.rifle_range=c2.rifle_range AND
 c1.team_members=c2.team_members AND
 c1.transect_name=c2.transect_name AND
 c1.transect_descr=c2.transect_descr AND
 c1.restored=c2.restored AND
 c1.compass_bearing=c2.compass_bearing AND
 c1.lat=c2.lat AND
 c1.lon=c2.lon
 );

 #delete all data in temp while leaving  primary key to update
DELETE FROM temp;