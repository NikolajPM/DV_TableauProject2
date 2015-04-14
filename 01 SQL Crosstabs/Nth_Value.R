nth_value <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT i.*, nth_value(Total_Count, 2) 
OVER (PARTITION BY Year) nth_value 
from 
(SELECT Year, Cause_of_Death, SUM(Count) as Total_Count 
FROM NYC_Deaths 
GROUP BY Year, Cause_of_Death 
ORDER BY Year, Total_Count desc) i 
ORDER BY Year, Total_Count desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_np6593', PASS='orcl_np6593', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); head(nth_value)