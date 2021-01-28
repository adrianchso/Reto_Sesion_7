install.packages("DBI")
install.packages("RMySQL")
install.packages("ggplot2")
library(DBI)
library(RMySQL)
library(ggplot2)
MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
install.packages("dplyr")
library("dplyr")
db<- dbGetQuery(MyDataBase, "select * from CountryLanguage")
esp.por<-db %>% filter(Language == "Spanish")
tail(esp.por)
ggplot(esp.por,aes(y = Percentage, x = CountryCode, fill = IsOfficial)) + 
  geom_bin2d() + 
  coord_flip()
