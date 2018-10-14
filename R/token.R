#' Get an active collab token
#'
#' @importFrom httr POST
#' @importFrom glue glue
#' @importFrom jsonlite read_json
#'
#' @param email your email
#' @param password your password. If in RStudio, it opens a connexion windows.
#'
#' @return a list of class `collab_token`
#' @export
#'

get_active_collab_token <- function(
  email = "colin@thinkr.fr", password = rstudioapi::askForPassword()
){
  #browser()

  res <- POST(
    url = "https://accounts.activecollab.com/api/v1/external/login",
    body = list(email = email, password = password)) %>%
    content()

  # This should work but doesn't
  # POST(
  #   url = glue("https://app.activecollab.com/{res$accounts[[1]]$name}/api/v1/issue-token-intent"),
  #   body = list(
  #     intent = res$user$intent,
  #     client_name = "AppName",
  #     client_vendor = "AppVendor"
  #   )
  # ) %>% content()

  # Workaround
  tmp <- tempfile(fileext = ".json")
  on.exit(unlink(tmp))
  system(
    glue(
      "curl -XPOST -d 'intent={res$user$intent}&client_name=AppName&client_vendor=AppVendor' https://app.activecollab.com/{res$accounts[[1]]$name}/api/v1/issue-token-intent > {tmp}"
    )
  )

  structure(
    list(token = read_json(tmp)$token,
         app_id = res$accounts[[1]]$name),
    class = "collab_token"
  )


}

