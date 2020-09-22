docker run --rm \
         -e PASSWORD=mypass \
         -p 8787:8787 \
         -v ~/git/realize-reproducible-r/03-mounting-volumes:/home/rstudio/03-mounting-volumes \
         rocker/rstudio:3.6.2