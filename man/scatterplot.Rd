% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots_script.R
\name{scatterplot}
\alias{scatterplot}
\title{Build a scatter plot to help understand the relationship between two
variables.}
\usage{
scatterplot(
  data,
  x_var,
  y_var,
  color_var,
  x_label,
  y_label,
  color_label,
  plot_title,
  plot_width,
  plot_height
)
}
\arguments{
\item{data}{A data frame containing}

\item{x_var}{The column that consists of the x values for the graph}

\item{y_var}{The column that consists of the y values for the graph}

\item{color_var}{The variable based on which colors will be assigned to
points in the plot}

\item{x_label}{Name given to the x axis}

\item{y_label}{Name given to the y axis}

\item{color_label}{Name gioven to the color legend}

\item{plot_title}{Name given to the entire graph}

\item{plot_width}{Width of the plot}

\item{plot_height}{Height of the plot}
}
\value{
a visualization of a scatter plot
}
\description{
Creates a scatterplot depicting relationship between 2 variables,
color-coding the different points into different groups,
naming the axes and the plot with the given labels,
in a given size
}
\examples{
test_data_1 <- data.frame(
x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
color = c("red", "blue", "green", "red")
)

scatterplot(test_data_1, "x", "y", "color", "x", "y", "Color",
"Test Plot", plot_width = 6, plot_height = 4)

}
