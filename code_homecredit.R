

import = function(libName){
  result = tryCatch({
    library(libName, character.only = T)
  }, error = function(e) {
    install.packages(libName, repos = "http://cran.us.r-project.org")
    library(libName, character.only = T)
  })
}

import("readr")
import("ggmap")
import("ggplot2")
import("mapview")
import("sf")
import("dplyr")
import("shiny")
import("lubridate")
import("weathermetrics")
import("magrittr")
import("plotly")
import("geosphere")


application_test_db <- read_csv("data_homecredit/application_test.csv",locale = locale(encoding = "ISO-8859-1"))
application_train_db <- read_csv("data_homecredit/application_train.csv",locale = locale(encoding = "ISO-8859-1"))
bureau_db <- read_csv("data_homecredit/bureau.csv",locale = locale(encoding = "ISO-8859-1"))
bureau_balance_db <- read_csv("data_homecredit/bureau_balance.csv",locale = locale(encoding = "ISO-8859-1"))
credit_card_balance_db <- read_csv("data_homecredit/credit_card_balance.csv",locale = locale(encoding = "ISO-8859-1"))
installments_payments_db <- read_csv("data_homecredit/installments_payments.csv",locale = locale(encoding = "ISO-8859-1"))
POS_CASH_balance_db <- read_csv("data_homecredit/POS_CASH_balance.csv",locale = locale(encoding = "ISO-8859-1"))
previous_application_db <- read_csv("data_homecredit/previous_application.csv",locale = locale(encoding = "ISO-8859-1"))
sample_submission_db <- read_csv("data_homecredit/sample_submission.csv",locale = locale(encoding = "ISO-8859-1"))

df <- data.frame(application_train_db)
View(df)

#Who request loan by sex (male or female or others)
groupsex <- group_by(df,CODE_GENDER)
cgroupsex <- summarise(groupsex, count = n())
#View(cgroupsex)

plot_ly(cgroupsex, x = cgroupsex$CODE_GENDER, y = cgroupsex$count, type = "bar")

#which Family status
groufamstatus <- group_by(df,NAME_FAMILY_STATUS)
cgroupfamstatus <- summarise(groufamstatus, count = n())
#View(cgroupfamstatus)

plot_ly(cgroupfamstatus, x = cgroupfamstatus$NAME_FAMILY_STATUS, y = cgroupfamstatus$count, type = "bar")


#Ver cliente que tem telefone em casa, email, mobile e FLAG_OWN_CAR