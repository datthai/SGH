/* Import the dataset into the WORK library */
libname mydata "C:\Users\Sheetal\Dropbox\PC\Downloads\software-20240407T220544Z-001\software\PROCSS_SIMULATION\process\data";

data zbior;
    set mydata.abt_app;
run;

/* Ensure the dataset is properly loaded before proceeding */
proc sql;
    create table zbior_score as
    select indataset.*
        , case
            when app_number_of_children < 0.5 then 50 	
            when 0.5 <= app_number_of_children and app_number_of_children < 1.5 then 56 
            when 1.5 <= app_number_of_children and app_number_of_children < 2.5 then 67 
            when 2.5 <= app_number_of_children then 100
            else 50 
          end as PSC_app_number_of_children
        , case
            when act_call_cc >= 1.579 then 50 
            when act_call_cc >= 1.254 and act_call_cc < 1.579 then 67 
            when act_call_cc >= 0.372 and act_call_cc < 1.254 then 81 
            when act_call_cc < 0.372 then 96
            else 50 
          end as PSC_act_call_cc
        , case
            when act_ccss_n_statC >= 0.5 and act_ccss_n_statC < 7.5 then 50 
            when act_ccss_n_statC < 0.5 then 57 
            when act_ccss_n_statC >= 7.5 and act_ccss_n_statC < 15.5 then 68 
            when act_ccss_n_statC is missing then 80 
            when act_ccss_n_statC >= 15.5 then 99
            else 50 
          end as PSC_act_ccss_n_statC
        , case
            when act_ccss_maxdue >= 2.5 then 50 
            when act_ccss_maxdue >= 1.5 and act_ccss_maxdue < 2.5 then 58 
            when act_ccss_maxdue >= 0.5 and act_ccss_maxdue < 1.5 then 78 
            when act_ccss_maxdue is missing then 96 
            when act_ccss_maxdue < 0.5 then 96
            else 50 
          end as PSC_act_ccss_maxdue
        , case
            when act9_n_arrears >= 6.5 then 50 
            when act9_n_arrears >= 4.5 and act9_n_arrears < 6.5 then 65 
            when act9_n_arrears >= 2.5 and act9_n_arrears < 4.5 then 73 
            when act9_n_arrears < 2.5 then 85
            else 50 
          end as PSC_act9_n_arrears
        , case
            when app_char_job_code in ('Owner company') then 50
            when app_char_job_code in ('Retired') then 84
            when app_char_job_code in ('Permanent') then 91   	
            else 50 
          end as PSC_app_char_job_code

/* , 1/(1+exp(-(-0.037950050567794054*(0.0+ calculated PSC_app_number_of_children + calculated PSC_act_call_cc + calculated PSC_act_ccss_n_statC + calculated PSC_act_ccss_maxdue + calculated PSC_act9_n_arrears + calculated PSC_app_char_job_code)+(16.452897110610362)))) as PD */  

        , 0.0
        + calculated PSC_app_number_of_children 
        + calculated PSC_act_call_cc 
        + calculated PSC_act_ccss_n_statC 
        + calculated PSC_act_ccss_maxdue 
        + calculated PSC_act9_n_arrears 
        + calculated PSC_app_char_job_code as SCORECARD_POINTS
    from zbior as indataset;
quit;
