library(poispkgs)

ts_6 <- poistimesheets::pts_get_timesheet(from = dtt_date("2022-05-01"), to = dtt_date("2022-09-30"))
hours_6 <- poistimesheets::pts_calc_hours(ts_6, hours_per_day = 6) |> 
  filter(Member == "Seb Dalgarno")

ts_75 <- poistimesheets::pts_get_timesheet(from = dtt_date("2022-10-01"), to = Sys.Date())
hours_75 <- poistimesheets::pts_calc_hours(ts_75, hours_per_day = 7.5) |> 
  filter(Member == "Seb Dalgarno")

extra_hours <- hours_6$ExtraHours + hours_75$ExtraHours
extra_hours

personal_paid <- (hours_6$PersonalPaid * hours_6$Hours + hours_75$PersonalPaid * hours_75$Hours)/(hours_6$Hours + hours_75$Hours)
personal_paid

billable <-  (hours_6$Billable * hours_6$Hours + hours_75$Billable * hours_75$Hours)/(hours_6$Hours + hours_75$Hours)
billable
