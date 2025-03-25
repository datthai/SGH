proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when 0.5 <= app_number_of_children then 130.0 
when app_number_of_children < 0.5 then 145.0 
else 130.0 end as PSC_app_number_of_children 
 
, case 
when 0.814 <= act_call_cc then 130.0 
when act_call_cc < 0.814 then 151.0 
else 130.0 end as PSC_act_call_cc 
 
, case 
when 2.5 <= act_ccss_n_loan then 130.0 
when act_ccss_n_loan < 2.5 then 194.0 
else 130.0 end as PSC_act_ccss_n_loan 
 
, case 
when act_cins_n_statB < 0.5 then 130.0 
when 0.5 <= act_cins_n_statB then 145.0 
else 130.0 end as PSC_act_cins_n_statB 
 
, case 
when 10.5 <= act_ccss_n_loans_hist then 130.0 
when act_ccss_n_loans_hist < 10.5 then 160.0 
when act_ccss_n_loans_hist is null then 519.0 
else 130.0 end as PSC_act_ccss_n_loans_hist 
 
, case 
when act_ccss_dueutl < 0.201 then 130.0 
when 0.201 <= act_ccss_dueutl then 182.0 
when act_ccss_dueutl is null then 254.0 
else 130.0 end as PSC_act_ccss_dueutl 
 
/* , 1/(1+exp(-(-0.034824798713976306*(0.0+ calculated PSC_app_number_of_children+ calculated PSC_act_call_cc+ calculated PSC_act_ccss_n_loan+ calculated PSC_act_cins_n_statB+ calculated PSC_act_ccss_n_loans_hist+ calculated PSC_act_ccss_dueutl)+(29.796730991403038)))) as PD */ 
 
, 0.0 
+ calculated PSC_app_number_of_children + calculated PSC_act_call_cc + calculated PSC_act_ccss_n_loan + calculated PSC_act_cins_n_statB + calculated PSC_act_ccss_n_loans_hist + calculated PSC_act_ccss_dueutl  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
