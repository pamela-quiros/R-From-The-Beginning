N <- 1000
counter <- 0

for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter +1
  }
}
counter
answer <- counter/N
answer