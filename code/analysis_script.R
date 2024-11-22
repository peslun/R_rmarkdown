# init ----

library(renv)
renv::init()

renv::install("gitcreds")
library(gitcreds)
gitcreds_set()

renv::install("rmarkdown")
library(rmarkdown)

renv::install(c('ggbiplot', 'factoextra',
'kableExtra', 'broom', 'ggrepel'))

renv::install("BiocManager")
renv::install("formatR")
renv::install("bioc::DESeq2")


renv::snapshot()

# knitting ----
#does not work
#rmarkdown::render("data/PCA_analysis.Rmd")
#https://stackoverflow.com/questions/56606299/in-rstudio-knit-always-works-but-rmarkdownrender-fails-on-second-run-bu

xfun::Rscript_call(
  rmarkdown::render,
  list(input = 'data/PCA_analysis.Rmd', output_dir='results')
)

rmarkdown::render("data/DEG_analysis.Rmd", output_dir='results',params=list( alpha = 0.2, top_genes = 20))

