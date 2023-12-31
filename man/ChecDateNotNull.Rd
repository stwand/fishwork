% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChecDateNotNull.R
\name{ChecDateNotNull}
\alias{ChecDateNotNull}
\title{Checking a table for rows}
\usage{
ChecDateNotNull(x)
}
\arguments{
\item{x}{\itemize{
\item table
}}
}
\value{
\itemize{
\item stops the script if there is data left in the table
}
}
\description{
Checking a table for rows
}
\examples{
\dontrun{
df <- iris
ChecDateNotNull(df)
df <- df[df$Species=="any"]
ChecDateNotNull(df)
}
}
