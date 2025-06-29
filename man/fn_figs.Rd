% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fn_figs.R
\name{fn_figs}
\alias{fn_figs}
\title{fn_figs}
\usage{
fn_figs(datos, CIPI, i, etiquetas, modelos)
}
\arguments{
\item{datos}{A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.}

\item{CIPI}{A data frame containing the values of: independent variable (xseq); fitted values, confidence and predicted interval (lower and upper values).}

\item{i}{An integer value indicating the regression analyzed.}

\item{etiquetas}{A list indicating the labels of the axes and their unit of measurement.}

\item{modelos}{A list of variables that are used for the regression model.}
}
\value{
Fig a customized scatter plot.
}
\description{
Individual plots for fitted models values.
}
\details{
The function creates a scatter plot with the observed values (points),
fitted regression (solid line) and its confidence interval (shaded area)
}
\examples{
\dontrun{
 FY <- fn_figs(datos, CIPI, i, etiquetas, modelos)
}

}
