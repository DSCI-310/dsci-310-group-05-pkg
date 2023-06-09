test_that("wrangle_training_data should return a data frame", {
  expect_s3_class(wrangle_training_data(
    training_data, predictor, strata_variable,
    group_labels
  ), "data.frame")
})


test_that("wrangle_training_data should return correct output for
          accurate input", {
            expect_identical(
              wrangle_training_data(
                training_data, predictor, strata_variable,
                group_labels
              ),
              output
            )
          })


test_that("wrangle_training_data throws an error if predictor or strata_variable
          are not in training_data", {
            expect_error(
              wrangle_training_data(training_data, error, strata_variable, group_labels)
            )

            expect_error(
              wrangle_training_data(training_data, predictor, error, group_labels)
            )
          })


test_that("wrangle_training_data throws an error if group_labels is an empty
          vector", {
  expect_error(
    wrangle_training_data(training_data, predictor, strata_variable, NULL)
  )

  expect_error(
    wrangle_training_data(
      training_data, predictor, strata_variable,
      character()
    )
  )
})
