max_diff <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select j.*, last_value(Max_Count) 
OVER (PARTITION BY Year ORDER BY Total_Count) - Total_Count Count_Diff
FROM
(select i.*, max(Total_Count) 
OVER (PARTITION BY Year) Max_Count
from
(SELECT Year, Cause_of_Death, SUM(Count) as Total_Count
FROM NYC_Deaths
GROUP BY Year, Cause_of_Death
ORDER BY Year, Total_Count desc) i) j
ORDER BY Year, Total_Count desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_np6593', PASS='orcl_np6593', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); head(max_diff)