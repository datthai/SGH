proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when act_age < 41.5 then 227.0 
when 41.5 <= act_age  and  act_age < 55.5 then 275.0 
when 55.5 <= act_age  and  act_age < 66.5 then 289.0 
when 66.5 <= act_age then 302.0 
else 227.0 end as PSC_act_age 
 
, case 
when 1.19 <= act_cc then 227.0 
when 0.855 <= act_cc  and  act_cc < 1.19 then 268.0 
when 0.268 <= act_cc  and  act_cc < 0.855 then 286.0 
when act_cc < 0.268 then 307.0 
else 227.0 end as PSC_act_cc 
 
, case 
when 12414.0 <= app_loan_amount then 227.0 
when 8886.0 <= app_loan_amount  and  app_loan_amount < 12414.0 then 246.0 
when 4986.0 <= app_loan_amount  and  app_loan_amount < 8886.0 then 262.0 
when app_loan_amount < 4986.0 then 279.0 
else 227.0 end as PSC_app_loan_amount 
 
, case 
when app_number_of_children < 0.5 then 227.0 
when 0.5 <= app_number_of_children  and  app_number_of_children < 1.5 then 265.0 
when 1.5 <= app_number_of_children then 320.0 
else 227.0 end as PSC_app_number_of_children 
 
, case 
when 1.5 <= act_cins_n_loan then 227.0 
when act_cins_n_loan < 1.5 then 328.0 
else 227.0 end as PSC_act_cins_n_loan 
 
, case 
when app_char_job_code in ('Contract') then 227.0 
when app_char_job_code in ('Owner company') then 278.0 
when app_char_job_code in ('Retired') then 293.0 
when app_char_job_code in ('Permanent') then 300.0 
else 227.0 end as PSC_app_char_job_code 
 
/* , 1/(1+exp(-(-0.03413338980450959*(0.0+ calculated PSC_act_age+ calculated PSC_act_cc+ calculated PSC_app_loan_amount+ calculated PSC_app_number_of_children+ calculated PSC_act_cins_n_loan+ calculated PSC_app_char_job_code)+(55.394542527042795)))) as PD */ 
 
, 0.0 
+ calculated PSC_act_age + calculated PSC_act_cc + calculated PSC_app_loan_amount + calculated PSC_app_number_of_children + calculated PSC_act_cins_n_loan + calculated PSC_app_char_job_code  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
