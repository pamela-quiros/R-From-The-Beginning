#---- -2 ---- -1 ---- 0 ---- 1 ---- 2

rm(anwser)
x <- rnorm(1)
if(x > 1){ 
  anwser <- "Greater than 1"
} else if(x >= -1){
  anwser <- "Between -1 and 1"
}  else{
    anwser <- "Less than -1"
}
