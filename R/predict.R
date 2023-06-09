#' Predicts the outcome of a target variable
#'
#' Given a fitted KNN workflow object and new test data, this function predicts
#' the outcome of a target variable for the test data using the KNN model.
#' The predicted outcome is then written to the data folder.
#'
#' @param knn_wf A fitted knn workflow object
#' @param test_data A dataframe containing test data to predict the outcome of
#' cannabis usage
#' @return Writes the predicted outcome of cannabis usage for the new data in
#' the data folder
#' @import workflows
#' @importFrom stats predict
#' @importFrom dplyr bind_cols
#' @export
#'
#' @examples
#' library(magrittr)
#' n <- 1000
#' mock_pred_data <- data.frame(
#'   predicted_outcome = sample(c("no", "yes"), n, replace = TRUE),
#'   X1 = rnorm(n),
#'   X2 = rnorm(n),
#'   X3 = rnorm(n)
#' )
#'
#' test_data <- data.frame(
#'   X1 = c(0.5, 0.1, 0.7),
#'   X2 = c(0.9, 0.3, 0.6),
#'   X3 = c(0.2, 0.4, 0.8)
#' )
#'
#' mock_spec <- parsnip::nearest_neighbor(
#'   weight_func = "rectangular",
#'   neighbors = parsnip::tune()
#' ) %>%
#'   parsnip::set_engine("kknn") %>%
#'   parsnip::set_mode("classification")
#'
#' mock_recipe <- recipes::recipe(as.formula(paste0("predicted_outcome", " ~ .")),
#'                                data = mock_pred_data
#'                                ) %>%
#' recipes::step_scale(recipes::all_predictors()) %>%
#' recipes::step_center(recipes::all_predictors())
#'
#' mock_knn_wf <- workflows::workflow() %>%
#'   workflows::add_recipe(mock_recipe) %>%
#'   workflows::add_model(mock_spec) %>%
#'   parsnip::fit(data = mock_pred_data)
#'
#' predict_drugs_workflow(mock_knn_wf, test_data)

predict_drugs_workflow <- function(knn_wf, test_data) {
  if (is.null(knn_wf)) {
    stop("The knn_wf input cannot be null.")
  }
  if (!is.data.frame(test_data)) {
    stop("The test data input must be a dataframe.")
  }
  pred_data <- stats::predict(knn_wf, test_data) %>%
    dplyr::bind_cols(test_data)

  return(pred_data)
}
