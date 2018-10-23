usethis::use_build_ignore("R/devstuffs.R")

# dep
usethis::use_package("crul")
usethis::use_package("glue")
usethis::use_package("jsonlite")
usethis::use_package("attempt")
usethis::use_package("tibble")
usethis::use_package("purrr")

# desc
d <- desc::description$new()
d$set("Authors@R", "person('Colin', 'Fay', email = 'colin@thinkr.fr', role = c('cre', 'aut'))")
d$add_urls("https://github.com/ThinkR-open/activecollabr")
d$set(Title = "Wrapper to the active collab API")
d$set(Description = "A Wrapper to the active collab API.")
d$set_version("0.0.0.9000")
d$write()
usethis::use_tidy_description()
usethis::use_mit_license("Colin Fay")
usethis::use_code_of_conduct()
usethis::use_readme_rmd()

usethis::use_pipe()
