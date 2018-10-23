#' Get an active collab token
#'
#' @import crul
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
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

  login <- HttpClient$new(url = "https://accounts.activecollab.com/api/v1/external/login")
  login <- login$post(body = list(email = email, password = password))
  int <- login$content %>% rawToChar() %>% jsonlite::fromJSON()

  token_intent <- HttpClient$new(url = glue::glue(
    "https://app.activecollab.com/{int$accounts$name}/api/v1/issue-token-intent"
  ))

  token_intent <- token_intent$post(body = glue::glue('intent={int$user$intent}&client_name=AppName&client_vendor=AppVendor'))
  tok <- token_intent$content %>% rawToChar() %>% jsonlite::fromJSON()



  structure(
    list(token = tok$token,
         app_id = int$accounts$name),
    class = "collab_token"
  )


}

