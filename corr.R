corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  res <- numeric()
  for(i in files){
    rData <- read.csv(i)
    if(sum(complete.cases(rData)) >= threshold){
      data <- rData[complete.cases(rData),]
      res <- c(res, cor(data$sulfate, data$nitrate))
    }
  }
  if(length(res)){
    res[!is.na(res)]
  }else{
    0
  }
}
