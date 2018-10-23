#' Get the list of project
#'
#' @param token a token of class `collab_token`
#'
#' @return a tibble
#' @export
#'
#' @examples
#' \dontrun{
#' get_projects_list(my_token)
#' }

get_projects_list <- function(token){

  stop_if_not_collab(token)

  get_endpoint(token, "projects")

}

#' Get the budget for a project
#'
#' @param token a token of class `collab_token`
#' @param id the id of the project
#'
#' @return a list
#' @export
#'
#' @examples
#' \dontrun{
#' get_project_budget(my_token, 19)
#' }

get_project_budget <- function(token, id){

  stop_if_not_collab(token)

  get_endpoint(token, glue("projects/{id}/budget"))

}

