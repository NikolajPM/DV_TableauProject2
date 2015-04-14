rank <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select i.*, rank()
OVER (PARTITION BY Year ORDER BY Total_Count desc) as Death_Rank
FROM 
(SELECT Year, Cause_of_Death, SUM(Count) as Total_Count
FROM NYC_Deaths
GROUP BY Year, Cause_of_Death
ORDER BY Year, Total_Count desc) i
ORDER BY Year, Total_Count desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_np6593', PASS='orcl_np6593', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); head(rank)

rank %>% select(YEAR, CAUSE_OF_DEATH, DEATH_RANK) %>% filter(DEATH_RANK <= 5) %>% spread(DEATH_RANK, CAUSE_OF_DEATH)