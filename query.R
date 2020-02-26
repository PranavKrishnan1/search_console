library(googleAuthR)
library(searchConsoleR)

options("googleAuthR.scopes.selected" =
          c("https://www.googleapis.com/auth/webmasters",
            "https://www.googleapis.com/auth/webmasters.readonly"))
options("googleAuthR.client_id" = "338493233376-nooh4fech24b0tv7mhjcs9lqqssjqmjr.apps.googleusercontent.com")
options("googleAuthR.client_secret" = "xk9HFR58KV_QovlmULzdiTg_")
gar_auth()


pages = search_analytics("https://www.manageengine.com/products/eventlog/",dimensions = c('page'))
page_1 = pages$page  
pages_2 = search_analytics("https://www.manageengine.com/products/eventlog/",dimensions = c('page','query'))
newdata = pages_2[order(pages_2$page),]
newdata2 = newdata
write.csv2(newdata2,"query.csv",row.names = F)


