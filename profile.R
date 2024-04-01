Rprof()
start <- Sys.time()

BDAY <- read.table("http://www.panix.com/~murphy/bdata.txt",head=TRUE) 
BDAY <- BDAY[-367,] #take out 367th row, which contain totals for bdays

ntrials <- 500000
counter <- 0

bday <- sample(BDAY$date, size=ntrials*41, replace=TRUE, prob = BDAY$count)
j <- 1

for(i in 1:ntrials){
  birthdays <- bday[j:(j+40)]
  j <- i+40
  
  if(sum(duplicated(birthdays)) > 0){
    counter <- counter + 1
  }
}

p <- counter/ntrials
MOE <- 2 * sqrt((p*(1-p))/ntrials)

Rprof(NULL)
summaryRprof()

Sys.time() - start
