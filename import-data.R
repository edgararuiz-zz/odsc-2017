library(odbc)
library(DBI)
library(nycflights13)


con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "master", 
                      Trusted_Connection = "True")


dbSendQuery(con, "CREATE DATABASE datawarehouse")

dbDisconnect(con)

con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "datawarehouse", 
                      Trusted_Connection = "True")


# Download and unpack a flights file

flights <- read_csv("data/2008.csv")


dbWriteTable(con, "flights", flights)

dbWriteTable(con, "airports", airports )

dbDisconnect(con)