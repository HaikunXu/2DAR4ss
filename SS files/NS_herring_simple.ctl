#V3.30.03.01-trans
#_data_and_control_files: NSHerring.dat // NSHerring.ctl
#_SS-V3.30.03.01-trans;_2017_04_19;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.5+
#_SS-V3.30.03.01-trans;user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_SS-V3.30.03.01-trans;user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
1  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
1 #  number of recruitment settlement assignments 
0 # year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)
#GPat month  area age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1946 1946
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 0 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
8 #_N_breakpoints
 0 1 2 3 4 5 6 7 # age(real) at M breakpoints
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
5 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern from wt-at-age.ss now invoked by read bodywt flag
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.00 1.8 0 0 0.8 0 -3 201 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 202 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 203 0 0 0 0.5 0 0 # NatM_p_3_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 204 0 0 0 0.5 0 0 # NatM_p_4_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 205 0 0 0 0.5 0 0 # NatM_p_5_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 206 0 0 0 0.5 0 0 # NatM_p_6_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 207 0 0 0 0.5 0 0 # NatM_p_7_Fem_GP_1
 0.00 1.8 0 0 0.8 0 -3 208 0 0 0 0.5 0 0 # NatM_p_8_Fem_GP_1
 5 30 19.6266 30 0.2 0 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 15 45 33.1185 45 0.2 0 -5 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.01 2 0.274525 0.251 0.8 0 -2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.2 0.42 0.8 0 -3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.2 0.2 0.8 0 -5 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 0 3 7.2e-006 0.0072 0.2 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 2.5 3.5 3.03 3.03 0.2 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 25 35 28.9 0.879 0.8 0 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.42 -1.14 0.8 0 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 1 1 0.8 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 4 0 0 0.8 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Bseas_1
 -4 4 1 1 0 0 -4 0 0 1948 2010 0.5 0 0 # CohortGrowDev
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 -2 2 1 0 99 -1 -2 # NatM_p_1_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_2_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_3_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_4_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_5_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_6_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_7_Fem_GP_1_ENV_add
 -2 2 1 0 99 -1 -2 # NatM_p_8_Fem_GP_1_ENV_add
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             4            40       18.1276            20            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1       0.65798          0.85          0.05             1          4          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.6           0.8           0.8             0         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -1          0          0          0          0          0          1          1 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1947 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -5 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1907 #_last_early_yr_nobias_adj_in_MPD
 1946 #_first_yr_fullbias_adj_in_MPD
 2010 #_last_yr_fullbias_adj_in_MPD
 2010 #_first_recent_yr_nobias_adj_in_MPD
 0.75 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1940R 1941R 1942R 1943R 1944R 1945R 1946R 1947R 1948R 1949R 1950R 1951R 1952R 1953R 1954R 1955R 1956R 1957R 1958R 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011F 2012F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.3 # F ballpark
-2001 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
 0.1 1 0 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2)

#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0 2 0.125845 0.01 99 6 1 # InitF_seas_1_flt_1Fishery
#2012 2012
# F rates by fleet
# Yr:  1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 -1.#IND
#
#_Q_setup
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         2         1         0         0         1         1  #  SCAI
         3         1         0         0         1         1  #  HERAS
         4         1         0         0         1         1  #  IBTS_Age1
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -6.24919             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_SCAI(2)
           -15            15     -0.208347             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_HERAS(3)
           -15            15      -9.07417             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_IBTS_Age1(4)
#_no timevary Q parameters
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 0 0 0 0  # 1 Fishery
 0 0 0 0  # 2 SCAI
 0 0 0 0  # 3 HERAS
 0 0 0 0  # 4 IBTS_Age1
#
#_age_selex_types
#_Pattern Discard Male Special
 17 0 0 0  # 1 Fishery
 0 0 0 0 # 2 SCAI
 17 0 0 0  # 3 HERAS
 11 0 0 0  # 4 IBTS_Age1
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
         -1000            10             0         -1000            99             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Fishery(1)
           -10            10       3.33112             0            99             0         2          0          0       1948       2011          4          0          0  #  AgeSel_P2_Fishery(1)
           -10            10       1.69252             0            99             0         2          0          0       1948       2011          4          0          0  #  AgeSel_P3_Fishery(1)
           -10            10       1.06693             0           0.2             0         3          0          0       1948       2011          4          0          0  #  AgeSel_P4_Fishery(1)
           -10            10      0.227731             0           0.2             0         4          0          0       1948       2011          4          0          0  #  AgeSel_P5_Fishery(1)
           -10            10      0.428324             0           0.2             0         4          0          0       1948       2011          4          0          0  #  AgeSel_P6_Fishery(1)
           -10            10      0.137335             0           0.2             0         4          0          0          0          0       0.25          0          0  #  AgeSel_P7_Fishery(1)
           -10            10     0.0289987             0           0.5             0         4          0          0          0          0       0.25          0          0  #  AgeSel_P8_Fishery(1)
           -10            10             0             0           0.5             0         -5          0          0          0          0       0.25          0          0  #  AgeSel_P9_Fishery(1)
         -1000            10      -1000            -1000            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_HERAS(3)
           -10            50       .7674             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P2_HERAS(3)
           -10            15      0.194236             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P3_HERAS(3)
           -10            15      0.182239             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P4_HERAS(3)
           -10            15     0.0576367             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P5_HERAS(3)
           -10            15     0.0949071             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P6_HERAS(3)
           -10            15       0.28017             0            99             0          2          0          0          0          0        0.5          0          0  #  AgeSel_P7_HERAS(3)
           -10            15             0             0            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P8_HERAS(3)
           -10            15             0             0            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P9_HERAS(3)
             0            15             1             0            99             0         -4          0          0          0          0          0          0          0  #  AgeSel_P1_IBTS_Age1(4)
             0            15             1             0            99             0         -4          0          0          0          0          0          0          0  #  AgeSel_P2_IBTS_Age1(4)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
#       0.0001             2          0.29          0.29           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#        -0.99          0.99             0             0           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
#       0.0001             2          0.20          0.20           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#        -0.99          0.99             0             0           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
#       0.0001             2          0.15          0.15           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#        -0.99          0.99             0             0           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
#       0.0001             2          0.08          0.08           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#        -0.99          0.99             0             0           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
#       0.0001             2          0.08          0.08           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#        -0.99          0.99             0             0           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_autocorr

# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
1   #  use 2D_AR1 selectivity(0/1)
#read specification for first 2D_AR1:  fleet, ymin, ymax, amin, amax, sigma_amax, use_rho, len1/age2, phase
 1 1948 2011  1   6   1 1 2 5
#       0.0001             2          0.29          0.29           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
       0.0001             5          0.96          1           0.5             6      -5  # AgeSel_P6_Fishery(1)_dev_se
        -0.8 0.8 0.0 0.3 0.5 6 -3  # rho_year for fleet:  1
        -0.8 0.8 0.0 0.3 0.5 6 -3  # rho_age for fleet:  1
#       0.0001             2          0.15          0.15           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#       0.0001             2          0.08          0.08           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
#       0.0001             2          0.08          0.08           0.5             6      -6  # AgeSel_P6_Fishery(1)_dev_se
 -9999 1948 2011  1   5   5 0 2  4 

#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      1     1     1     0     0     2     1     0     0     0     0     0
#      1     2     2     0     0     2     2     0     0     0     0     0
#      1     3     3     0     0     2     3     0     0     0     0     0
#      1     4     4     0     0     2     4     0     0     0     0     0
#      1     5     5     0     0     2     5     0     0     0     0     0
#      1     6     6     0     0     2     6     0     0     0     0     0
#      1     7     7     0     0     2     7     0     0     0     0     0
#      1     8     8     0     0     2     8     0     0     0     0     0
#      5     2     9     0     0     2     0     1     3  1948  2011    -1      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     3    11     0     0     2     0     2     3  1948  2011    -1      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     4    13     0     0     2     0     3     3  1948  2011    -1      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     5    15     0     0     2     0     4     3  1948  2011    -1      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     6    17     0     0     2     0     5     3  1948  2011    -1      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
      5      1      2.0
      1      2       0.2
      1      3     -0.03
      5      3      1.0
      1      4      0.15
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset
# read 1 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 9 1 1 0.001 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 #_CPUE/survey:_2
#  1 1 1 1 #_CPUE/survey:_3
#  1 1 1 1 #_CPUE/survey:_4
#  1 1 1 1 #_agecomp:_1
#  0 0 0 0 #_agecomp:_2
#  1 1 1 1 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  0.001 0.001 0.001 0.001 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

