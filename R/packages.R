# package checker


for (package in c("devtools", "phangorn")){
  if(package %in% rownames(installed.packages()) == FALSE) {
    install.packages(package)
  } else {
    #print(paste0(package," is installed"))
    cat(package," is already installed\n")
  }
}

for (i in "hello"){
  print(i)
}
