* Import Excel data;
proc import datafile="/home/u63340910/AML/AML Persistent Mutation Data Updated 2.xlsx" out=data dbms=xlsx replace;
run;


* Rename variables;
data data;
set data;
rename `Overall Survival from Transplant (Days)` = Ov_suv_trans_days
       `Dead (0 Alive, 1 Deceased)` = status
       /* Add other renames similarly */
       ;
run;

* Filter for pre-transplant and post-transplant data;
data data_pre data_post;
set data;
if Type = "Pretransplant" then output data_pre;
else if Type = "Post-transplant" then output data_post;
run;
