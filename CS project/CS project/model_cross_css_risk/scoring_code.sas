/* Import the dataset into the WORK library */
libname mydata "D:\Credit Scoring\";

data zbior;
    set mydata.abt_app;
run;

/* Ensure the dataset is properly loaded before proceeding */
proc sql;
    create table zbior_score as
    select indataset.*
        , case
           when act_ccss_n_statC < 10.5 then 33
            else 93 
          end as PSC_act_ccss_n_statC

		 , case
            when act_ccss_maxdue >= 0.5 then 33
            else 73
          end as PSC_act_ccss_maxdue

        , case
            when agr6_Min_CMaxA_Due >= 0.5 then 33
            else 57
          end as PSC_agr6_Min_CMaxA_Due

		, case
             when ags12_Mean_CMaxC_Days < 14.577 then 33
            else 67
          end as PSC_ags12_Mean_CMaxC_Days 

/* , 1/(1+exp(-(-0.03392642951593614*(0.0+ calculated PSC_app_number_of_children + calculated PSC_act_call_cc + calculated PSC_act_ccss_n_statC + calculated PSC_act_ccss_maxdue + calculated PSC_act9_n_arrears + calculated PSC_app_char_job_code)+(9.13571510908732)))) as PD */  

        , 0.0
        + calculated PSC_act_ccss_n_statC
        + calculated PSC_act_ccss_maxdue
        + calculated PSC_agr6_Min_CMaxA_Due
        + calculated PSC_ags12_Mean_CMaxC_Days as SCORECARD_POINT
    from zbior as indataset;
quit;