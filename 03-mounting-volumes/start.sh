docker run --rm \
         -e PASSWORD=mypassword \
         -p 8787:8787 \
         -v ~/git/realizing-reproducible-r/03-mounting-volumes:/home/rstudio/03-mounting-volumes \
         rocker/rstudio:3.6.2