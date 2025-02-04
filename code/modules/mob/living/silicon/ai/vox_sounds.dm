// List is required to compile the resources into the game when it loads.
// Dynamically loading it has bad results with sounds overtaking each other, even with the wait variable.
#ifdef AI_VOX

// Regex for collecting a list of ogg files
// (([a-zA-Z,.]+)\.ogg)

// For vim
// :%s/\(\(.*\)\.ogg\)/"\2" = 'sound\/vox_fem\/\1',/g
GLOBAL_LIST_INIT(vox_sounds, list("unidentified_confirm_civilstatus" = 'sound/announcer/vox_fem/f_confirmcivilstatus_1_spkr.ogg',
"local_unrest_detected" = 'sound/announcer/vox_fem/f_localunrest_spkr.ogg',
"permissive_inactive_coercion" = 'sound/announcer/vox_fem/f_rationunitsdeduct_3_spkr.ogg',
"assume_inspection_positions" = 'sound/announcer/vox_fem/f_trainstation_assumepositions_spkr.ogg',
"miscount_detected" = 'sound/announcer/vox_fem/f_trainstation_cooperation_spkr.ogg',
"failure_to_cooperate" = 'sound/announcer/vox_fem/f_trainstation_offworldrelocation_spkr.ogg',
"nonstandard_exogen" = 'sound/announcer/vox_fem/fprison_nonstandardexogen.ogg',
"priority_identification" = 'sound/announcer/vox_fem/fprison_missionfailurereminder.ogg',
"failure_to_cooperate" = 'sound/announcer/vox_fem/f_trainstation_assemble_spkr.ogg',
"anticitizen_reported" = 'sound/announcer/vox_fem/f_anticitizenreport_spkr.ogg'))
#endif
