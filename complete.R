complete <- function(directory, id = 1:332){
  files <- list.files(directory, full.names = TRUE)
  r <- data.frame()
  for(i in id){
    d <- read.csv(files[i])
    r <- rbind(r, c(i, sum(complete.cases(d))))
  }
  colnames(r) <- c("id", "nobs")
  r
}