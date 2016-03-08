pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  allFilesData <- data.frame()
  for(i in id){
    data <- read.csv(files[i])
    allFilesData <- rbind.data.frame(allFilesData, data)
  }
  mean(allFilesData[pollutant][!is.na(allFilesData[pollutant])])
}