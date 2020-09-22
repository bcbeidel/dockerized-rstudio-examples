FROM rocker/verse:3.6.1

# Set Environment Variables
ENV PROJECT_NAME 05-extending-the-dockerfile
ENV APP_ROOT /home/rstudio/$PROJECT_NAME

RUN echo "session-default-working-dir=${APP_ROOT}" >> /etc/rstudio/rsession.conf

LABEL org.bcbeidel.image.authors="Brandon Beidel" \
      org.bcbeidel.image.title="rocker-extending-the-dockerfile" \
      org.bcbeidel.image.description="Example Development Environment" \
      org.bcbeidel.image.source="https://github.com/bcbeidel/realize-reproducible-r"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
      awscli \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Add CRAN options to r-project and internal to switch from MRAN
RUN echo 'options(repos = c(CRAN = "https://cloud.r-project.org/")' >> /usr/local/lib/R/etc/Rprofile.site 
RUN R -e "options(renv.verbose = TRUE)"

# install remotes; ensure that it is present for install of renv
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"

# Install renv for package management
ARG RENV_VERSION="0.9.2-5"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}'); library(renv)"
RUN R -e "renv::consent(provided = TRUE)"

# Ensure renv installs in root directory of app
WORKDIR ${APP_ROOT}

# Restore R Packages with renv
COPY renv.lock ${APP_ROOT}/renv.lock
RUN R -e "renv::activate()"
RUN R -e "renv::restore(confirm = FALSE)"

WORKDIR ${APP_ROOT}
COPY . ${APP_ROOT}

CMD ["/init"]
