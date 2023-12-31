% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/restor.R
\name{restor}
\alias{restor}
\title{Restoring a variable from a backup}
\usage{
restor(x)
}
\arguments{
\item{x}{\itemize{
\item name of the variable being restored
}}
}
\value{
backup variable
}
\description{
Restoring a variable from a backup
}
\examples{
\dontrun{
x <- 1:100
back(x)
rm(x)
restore(x)
}
}
