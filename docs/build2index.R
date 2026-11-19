# Builds the static site that GitHub Pages serves (no R needed at runtime).
# Run from this folder:  source("build.R")

library(htmltools)

out <- "docs"   # in GitHub: Settings > Pages > Deploy from branch > main > /docs

# load `ui` from app.R without launching the app
env <- new.env()
sys.source("app.R", envir = env)

dir.create(out, showWarnings = FALSE)
save_html(env$ui, file.path(out, "index.html"))

# copy images, favicons and the CV next to index.html
file.copy(list.files("www", full.names = TRUE), out, recursive = TRUE, overwrite = TRUE)

message("Done. Site is in ", normalizePath(out))