df_1 = read.csv("search_console.csv")
df = df_1[order(df_1$Page),]
df_2 = df[1:4,]

len = length(df$Page)

for (i in 1:len){
  word = df$Page[i]
  if(df$Page[i+1]==df$Page[i]){next}
  token = 0
  for (j in 1:4){
    df_2 = rbind(df_2,df[i+j,])
  }
}

