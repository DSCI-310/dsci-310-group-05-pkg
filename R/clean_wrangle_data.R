#' Clean and wrangle data
#'
#' This function creates a data frame by grouping training data by predictor
#' and strata_variables & adds a group_labels column
#'
#' @param training_data a dataframe for training data
#' @param predictor a string representing the variable to be used as the
#' predictor for the algorithm
#' @param strata_variable a string representing the variable that will be set as
#'  the strata in initial_split
#' @param group_labels list of strings representing the group names
#'
#' @return cleaned and wrangled training data grouped by predictor and
#' strata_variable & add a label column
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr group_by summarize n
#'
#' @export
#'
#' @examples
#' training_data <- data.frame(
#'   predictor = c("yes", "no", "yes", "no"),
#'   strata_variable = c("yes", "yes", "no", "no"),
#'   outcome = c(1, 1, 0, 1)
#'   )
#'
#'  predictor <- "predictor"
#'  strata_variable <- "strata_variable"
#'  group_labels <- c("Group 1")
#'
#'  wrangle_training_data(
#'   training_data, strata_variable, predictor,
#'   group_labels)
#'
wrangle_training_data <- function(training_data, predictor, strata_variable,
                                  group_labels) {
  # returns a data frame with four columns: predictor, strata_variable, n, label

  # Checking if predictor and strata_variable are one of the column names in
  # from training data
  if (!(as.character(substitute(predictor)) %in% colnames(training_data)) ||
      !(as.character(substitute(strata_variable)) %in%
        colnames(training_data))) {
    stop("Unexpected input: predictor or strata_variable not found in the
         training_data")
  }
  # Checking if group_labels is a non-empty vector and checking if it is null.
  if (!is.vector(group_labels) || length(group_labels) == 0 ||
      is.null(group_labels)) {
    stop("Unexpected input: group_labels must be a vector that is not-empty")
  }

  # Group training_data by predictor and strata_variable, summarize and add
  # label column
  grouped <- training_data %>%
    dplyr::group_by({{ predictor }}, {{ strata_variable }}) %>%
    dplyr::summarize(n = dplyr::n())
  grouped$label <- group_labels

  return(grouped)
}
