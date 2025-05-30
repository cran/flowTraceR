% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect_traceR_levels.R
\name{connect_traceR_levels}
\alias{connect_traceR_levels}
\title{Connects traced levels}
\usage{
connect_traceR_levels(
  input_df,
  level = c("proteinGroups", "modified_peptides")
)
}
\arguments{
\item{input_df}{A tibble with flowTraceR´s traced level information e.g. traceR_traced_proteinGroups.}

\item{level}{Choose between \code{proteinGroups} or \code{modified_peptides}. Connection between proteinGroups/modified_peptides and precursor categorization. Default is proteinGroups.}
}
\value{
This function returns a tibble with one of the following columns depending on chosen \code{level}:
\itemize{
\item traceR_connected_pg_prec - connection between proteinGroup categorization and precursor categorization.
\item traceR_connected_mod.pep_prec - connection between modified peptide categorization and precursor categorization.
}
}
\description{
Connects two levels after categorization in unique and common entries.
}
\details{
Based on flowTraceR´s categorization in unique and common identifications two levels are connected. Possible connections are proteinGroup or modified peptide with precursor categorization.
}
\examples{
# Load libraries
library(tidyr)
library(stringr)
library(tibble)

# DIA-NN example data
diann <- tibble::tibble(
   "traceR_traced_proteinGroups" = c("common", "common", "unique"),
   "traceR_traced_mod.peptides" = c("common", "unique", "common"),
   "traceR_traced_precursor" = c("common", "unique", "common"),
   "traceR_proteinGroups" = c("P02768", "P02671", "Q92496"),
   "traceR_mod.peptides" = c("AAC(UniMod:4)LLPK", "RLEVDIDIK", "EGIVEYPR"),
   "traceR_mod.peptides_unknownMods" = c(FALSE, FALSE, FALSE),
   "traceR_precursor" = c("AAC(UniMod:4)LLPK1", "RLEVDIDIK2", "EGIVEYPR2"),
   "traceR_precursor_unknownMods" = c(FALSE, FALSE, FALSE)
)

spectronaut <- tibble::tibble(
   "traceR_traced_proteinGroups" = c("common", "common", "unique"),
   "traceR_traced_mod.peptides" = c("common", "unique", "common"),
   "traceR_traced_precursor" = c("common", "unique", "common"),
   "traceR_proteinGroups" = c("P02768", "P02671", "Q02985"),
   "traceR_mod.peptides" = c("AAC(UniMod:4)LLPK", "M(UniMod:35)KPVPDLVPGNFK", "EGIVEYPR"),
   "traceR_mod.peptides_unknownMods" = c(FALSE, FALSE, FALSE),
   "traceR_precursor" = c("AAC(UniMod:4)LLPK1", "M(UniMod:35)KPVPDLVPGNFK2", "EGIVEYPR2"),
   "traceR_precursor_unknownMods" = c(FALSE, FALSE, FALSE)
)

# Connect Precursor and ProteinGroup level
diann_connected <- connect_traceR_levels(input_df = diann, level = "proteinGroups")

spectronaut_connected <- connect_traceR_levels(input_df = spectronaut, level = "proteinGroups")
}
\author{
Oliver Kardell
}
