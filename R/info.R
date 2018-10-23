#' Get Global Info
#'
#' @param token a token of class `collab_token`
#'
#' @return a list
#' @export
#'
#' @examples
#' \dontrun{
#' get_info(my_token)
#' }

get_info <- function(token){

  stop_if_not_collab(token)

  get_endpoint(token, "info")

}
