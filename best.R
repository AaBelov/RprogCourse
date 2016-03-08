best <- function(state, outcome){
  d <- read.csv("outcome-of-care-measures.csv")
  if(is.element(state, d$State)){
    if(is.element(outcome, c("heart attack", "heart failure", "pneumonia"))){
      if(outcome == "heart attack"){
        colName = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
      }else if(outcome == "heart failure"){
        colName = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
      }else if(outcome == "pneumonia"){
        colName = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
      }
      stateHospitals <- d[d$State == state, c(colName, "Hospital.Name")]
      values <- stateHospitals$colName
      values <- values[values != "Not Available"]
      noNAHospitals <- shos[shos$colName != as.factor("Not Available"),]
      noNAHospitals$colName <- factor(noNAHospitals$colName)
      mind <- min(as.numeric(noNAHospitals$colName))
      bestHospitals <- noNAHospitals[noNAHospitals$colname == mind]$Hospital.Name
      bestHospitals <- sort(as.vector(bestHospitals))
      bestHospitals[1]
    }else{
      stop("invalid outcome")
    }
  }else{
    stop("invalid state")
  }
}