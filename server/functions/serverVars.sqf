//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\

if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_groupBeaconList = []; 
publicVariable "pvar_groupBeaconList";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
if (isServer) then {
	"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};
};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns

civilianVehicles = [
	"car_hatchback",
	"car_sedan",
	"datsun1_civil_2_covered",
	"SkodaGreen",
	"Lada2",
	"V3S_Civ",
	"UralCivil",
	"VWGolf",
	"MMT_Civ",
	"Ikarus_TK_CIV_EP1",
	"Lada1_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	"S1203_TK_CIV_EP1",
	"UAZ_Unarmed_TK_CIV_EP1",
	"ATV_US_EP1",
	"BAF_Offroad_W",
	"S1203_ambulance_EP1",
	"LadaLM",
	"hilux1_civil_2_covered"
];

//Military Vehicle List - Random Spawns
militaryVehicles = [
	"UAZ_CDF",
	"SUV_PMC",
	"MTVR",
	"BAF_Offroad_W",
	"HMMWV",
	"HMMWV_Ambulance",
	"S1203_ambulance_EP1",
	"GAZ_Vodnik_MedEvac"
];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = [
	"ArmoredSUV_PMC",
	"Pickup_PK_GUE",
	"UAZ_MG_TK_EP1",
	"LandRover_MG_TK_INS_EP1",
	"HMMWV_M2",
	"HMMWV_Armored",
	"HMMWV_MK19",
	"HMMWV_TOW",
	"GAZ_Vodnik",
	"M113_TK_EP1", 
	"HMMWV_M1035_DES_EP1", 
	"HMMWV_M998A2_SOV_DES_EP1", 
	"HMMWV_M1151_M2_DES_EP1",
	"HMMWV_M998_crows_M2_DES_EP1", 
	"HMMWV_M998_crows_MK19_DES_EP1"
];

//Object List - Random Helis.
staticHeliList = [
	"UH1H_TK_GUE_EP1",
	"Mi17_Civilian",
	"MV22",
	"CH_47F_EP1",
	"Mi17_TK_EP1",
	"MH6J_EP1",
	"UH60M_MEV_EP1",
    "AH6X_EP1",
	"Mi17_Ins"
];

//Item Config
pickupList = [
	"Satelit",
	"EvMoney",
	"Suitcase",
	"Fuel_can"
];

//Object List - Random Spawns.
objectList = [
	"Land_Barrel_water",
	"Land_prebehlavka",
	"Land_leseni2x",
	"Fort_Crate_wood",
	"Land_CamoNet_NATO",
	"Land_Barrel_water",
	"Land_stand_small_EP1",
	"Land_stand_small_EP1",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBBarrier10xTall",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier5x",
	"Land_Misc_deerstand",
	"Fort_Barricade",
	"Concrete_Wall_EP1",
	"Concrete_Wall_EP1",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_round",
	"Land_fort_bagfence_corner",
	"Land_BagFenceLong",
	"Land_BagFenceLong",
	"Land_fort_artillery_nest",
	"Land_fortified_nest_small_EP1",
	"Land_Misc_deerstand",
	"Land_fort_rampart",
	"Land_fort_rampart_EP1",
	"Land_HBarrier_large",
	"Land_HBarrier_large",
	"Land_Misc_Scaffolding",
	"Land_Fort_Watchtower_EP1",
	"Land_Fort_Watchtower",
	"Land_fortified_nest_big",
	"RampConcrete",
	"Base_WarfareBBarrier10xTall",
	"WarfareBDepot",
	"WarfareBCamp",
	"Hedgehog",
	"Land_ConcreteRamp",
	"Land_CncBlock_Stripes",
	"Land_Campfire_burning",
	"Land_GuardShed",
	"Land_tent_east",
	"Land_ConcreteBlock",
	"Land_A_Castle_Stairs_A",
	"Land_Barrack2",
	"Land_Hlidac_budka",
	"Land_Ind_SawMillPen",
	"Land_Shed_wooden",
	"Land_Wall_Gate_Village",
	"Land_plot_green_branka",
	"Land_plot_rust_vrata",
	"Land_plot_green_vrata",
	"CampEast",
	"CampEast_EP1",
	"Misc_cargo_cont_net2",
	"Misc_cargo_cont_small2",
	"Fort_RazorWire",
	"Land_HBarrier1",
	"Land_HBarrier3",
	"Land_Fort_Watchtower",
	"Sign_Danger",
	"Land_Misc_Well_L_EP1",
	"Land_transport_kiosk_EP1"
];
                                         
//Object List - Random Spawns.
staticWeaponsList = [
	"M2StaticMG_US_EP1",
	"DSHKM_TK_INS_EP1",
	"DSHkM_Mini_TriPod_CDF",
	"KORD_high",
	"KORD",
	"M2HD_mini_TriPod"
];



//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = [
	"AK_107_GL_kobra",
	"AK_107_kobra",
	"AK_47_M",
	"AK_47_S",
	"AK_74",
	"AK_74_GL",
	"AK_74_GL_kobra",
	"BAF_L110A1_Aim",
	"BAF_L7A2_GPMG",
	"BAF_L85A2_RIS_ACOG",
	"BAF_L85A2_UGL_Holo",
	"BAF_L86A2_ACOG",
	"bizon",
	"bizon_silenced",
	"FN_FAL",
	"G36a",
	"G36_C_SD_eotech",
	"LeeEnfield",
	"M1014",
	"M16A2",
	"M14_EP1",
	"M16A2GL",
	"m16a4",
	"M240",
	"M249",
	"M4A1_Aim",
	"M4A1_HWS_GL",
	"M4A3_CCO_EP1",
	"M60A4_EP1",
	"m8_carbine",
	"MG36",
	"Mk_48",
	"MP5A5",
	"Sa58V_EP1",
	"Sa58V_CCO_EP1",
	"Saiga12K",
	"SCAR_H_CQC_CCO",
	"SCAR_L_CQC"
];
                
blacklist = [
	"Land_stand_small_EP1",
	"Land_stand_meat_EP1",
	"Land_stand_waterl_EP1",
	"Land_Crates_stack_EP1",
	"Land_Carpet_rack_EP1",
	"Land_Market_stalls_01_EP1",
	"Land_Market_stalls_02_EP1",
	"Land_Market_shelter_EP1",
	"Land_Misc_Well_L_EP1",
	"Land_Misc_Well_C_EP1",
	"Fort_StoneWall_EP1",
	"Land_Wall_L_2m5_gate_EP1",
	"Land_Wall_L1_gate_EP1",
	"Land_Wall_L3_gate_EP1",
	"Land_Wall_L3_5m_EP1",
	"Land_Wall_L3_pillar_EP1",
	"Land_Wall_L_Mosque_1_EP1",
	"Land_Wall_L_Mosque_2_EP1",
	"Wall_FenW2_6_EP1",
	"Wall_L_2m5_EP1",
	"Wall_L1_2m5_EP1",
	"Wall_L1_5m_EP1",
	"Wall_L2_5m_EP1",
	"Wall_L3_5m_EP1",
	"Land_BoatSmall_1",
	"Land_D_Mlyn_Vys",
	"Land_D_Pec_Vez1",
	"Land_Ind_BoardsPack1",
	"Land_Ind_Shed_02_end",
	"Land_Ind_Shed_01_end",
	"Land_Ind_Shed_01_main",
	"Land_Ind_BoardsPack2",
	"Land_Dam_Barrier_40",
	"Land_Dam_ConcP_20",
	"Land_Dam_Conc_20",
	"Land_D_Pec_Vez2",
	"Land_BoatSmall_2a",
	"Land_BoatSmall_2b",
	"Land_fort_artillery_nest",
	"Land_fort_rampart",
	"Land_Vez_Pec",
	"Land_runway_edgelight",
	"Land_Nav_Boathouse_PierR",
	"Land_Nav_Boathouse_PierT",
	"Land_Nav_Boathouse_PierL",
	"Land_fort_bagfence_corner",
	"Land_fort_bagfence_long",
	"Land_fort_bagfence_round",
	"Land_Fort_Watchtower",
	"Land_NavigLight",
	"Land_Panelak",
	"Land_Panelak2",
	"Land_Panelak3",
	"Land_plot_istan1_rovny_gate",
	"Land_Plot_Ohrada_Pruchozi",
	"Land_plot_zboreny",
	"Land_plot_zed_drevo1_branka",
	"Land_psi_bouda",
	"Land_A_Castle_Bastion",
	"Land_A_Castle_Gate",
	"Land_A_Castle_Wall1_20",
	"Land_A_Castle_Wall1_20_Turn",
	"Land_A_Castle_Wall1_Corner",
	"Land_A_Castle_Wall1_End",
	"Land_A_Castle_Wall1_End_2",
	"Land_A_Castle_Wall2_30",
	"Land_A_Castle_Wall2_Corner",
	"Land_A_Castle_Wall2_End",
	"Land_A_Castle_Wall2_End_2",
	"Land_A_Castle_WallS_10",
	"Land_Gate_wood2_5",
	"Land_Ind_Expedice_2",
	"Land_Ind_Expedice_3",
	"Land_Ind_Timbers",
	"Land_Rail_Semafor",
	"Land_Rail_Zavora",
	"Land_Stoplight02",
	"Land_Wall_CBrk_5_D",
	"Land_brana02nodoor",
	"Land_molo_drevo_bs",
	"Land_molo_drevo_end",
	"Land_nav_pier_m_2",
	"Land_psi_bouda",
	"Land_rails_bridge_40",
	"Land_seno_balik",
	"Land_sloup_vn",
	"Land_sloup_vn_drat",
	"Land_sloup_vn_dratZ",
	"Land_sloup_vn_drat_d",
	"ZavoraAnim",
	"Land_vez",
	"Land_pumpa",
	"Land_Gate_Wood1_5",
	"Land_fortified_nest_big",
	"Land_fortified_nest_small",
	"Fort_Nest",
	"Land_Fire",
	"Land_Fire_barrel",
	"Land_Fire_barrel_burning",
	"Land_Fire_burning",
	"Land_Campfire",
	"Land_Campfire_burning",
	"Misc_TyreHeap",
	"Land_ConcreteBlock",
	"Land_ConcreteRamp",
	"Land_sign_altar",
	"Land_Sign_Bar_RU",
	"Land_Sign_BES",
	"Land_sign_TEC",
	"Land_sign_ulgano",
	"Land_SignB_Gov",
	"Land_SignB_GovPolice",
	"Land_SignB_GovSchool",
	"Land_SignB_GovSign",
	"Land_SignB_Hotel_CZ",
	"Land_SignB_Hotel_CZ2",
	"Land_SignB_Hotel_CZ3",
	"Land_SignB_Pharmacy",
	"Land_SignB_PostOffice",
	"Land_SignB_Pub_CZ1",
	"Land_SignB_Pub_CZ2",
	"Land_SignB_Pub_CZ3",
	"Land_SignB_Pub_RU1",
	"Land_SignB_Pub_RU2",
	"Land_SignB_Pub_RU3",
	"Land_Ind_Timbers",
	"Haystack",
	"Pile_of_wood",
	"Land_IndPipe1_stair",
	"Land_IndPipe1_stair_todo_delete",
	"Land_IndPipe2_big_9",
	"Land_IndPipe2_big_18",
	"Land_IndPipe2_big_18ladder",
	"Land_IndPipe2_big_support",
	"Land_IndPipe2_bigL_R",
	"Land_IndPipe2_bigL_L",
	"Land_IndPipe2_bigBuild1_R",
	"Land_IndPipe2_bigBuild1_L",
	"Land_IndPipe2_bigBuild2_R",
	"Land_IndPipe2_bigBuild2_L",
	"Land_IndPipe2_big_ground1",
	"Land_IndPipe2_big_ground2",
	"Land_IndPipe2_T_R",
	"Land_IndPipe2_T_L",
	"Land_IndPipe2_Small_9",
	"Land_IndPipe2_Small_ground1",
	"Land_IndPipe2_Small_ground2",
	"Land_IndPipe2_SmallBuild1_L",
	"Land_IndPipe2_SmallBuild1_R",
	"Land_IndPipe2_SmallBuild2_L",
	"Land_IndPipe2_SmallBuild2_R",
	"Land_IndPipe2_SmallL_L",
	"Land_IndPipe2_SmallL_R",
	"Land_nav_pier_m_2",
	"land_nav_pier_c",
	"land_nav_pier_c2",
	"land_nav_pier_c2_end",
	"land_nav_pier_c_270",
	"land_nav_pier_c_90",
	"land_nav_pier_c_big",
	"land_nav_pier_C_L",
	"land_nav_pier_C_L10",
	"land_nav_pier_C_L30",
	"land_nav_pier_C_R",
	"land_nav_pier_C_R10",
	"land_nav_pier_C_R30",
	"land_nav_pier_c_t15",
	"land_nav_pier_c_t20",
	"land_nav_pier_F_17",
	"land_nav_pier_F_23",
	"land_nav_pier_m",
	"land_nav_pier_m_1",
	"land_nav_pier_m_end",
	"land_nav_pier_M_fuel",
	"land_nav_pier_pneu",
	"Land_ruin_chimney",
	"Land_ruin_corner_1",
	"Land_ruin_corner_2",
	"Land_ruin_rubble",
	"Land_ruin_walldoor",
	"Land_ruin_wall",
	"land_nav_pier_uvaz",
	"Land_Misc_Cargo1C",
	"Land_Misc_Cargo1D",
	"Land_Misc_Cargo1E",
	"Land_Misc_Cargo1F",
	"Land_Misc_Cargo1G",
	"Land_Misc_Cargo2B",
	"Land_Misc_Cargo2C",
	"Land_Misc_Cargo2D",
	"Land_Misc_Cargo2E",
	"Land_Misc_deerstand",
	"Land_Misc_GContainer_Big",
	"Land_sign_elektrozavodsk",
	"Land_sign_balota",
	"Land_sign_berezino",
	"Land_sign_chernogorsk",
	"Land_sign_kamenka",
	"Land_sign_kamyshovo",
	"Land_sign_komarovo",
	"Land_sign_prigorodki",
	"Land_sign_solnichnyi",
	"Land_wagon_box",
	"Land_wagon_flat",
	"Land_wagon_tanker",
	"Land_Wall_CBrk_5_D",
	"Land_Wall_CGry_5_D",
	"Land_Wall_Gate_Ind1_L",
	"Land_Wall_Gate_Ind1_R",
	"Land_Gate_IndVar2_5",
	"Land_Gate_wood1_5",
	"Land_Gate_wood2_5",
	"Land_Wall_Gate_Ind2A_R",
	"Land_Wall_Gate_Ind2B_R",
	"Land_Wall_Gate_Ind2Rail_R",
	"Land_Wall_Gate_Wood1",
	"Land_Wall_Gate_Ind2A_L",
	"Land_Wall_Gate_Ind2B_L",
	"Land_Wall_Gate_Ind2Rail_L"
];