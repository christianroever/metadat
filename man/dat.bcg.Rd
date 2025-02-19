\name{dat.bcg}
\docType{data}
\alias{dat.bcg}
\title{Studies on the Effectiveness of the BCG Vaccine Against Tuberculosis}
\description{Results from 13 studies examining the effectiveness of the Bacillus Calmette-Guerin (BCG) vaccine against tuberculosis. \loadmathjax}
\usage{
dat.bcg
}
\format{The data frame contains the following columns:
\tabular{lll}{
\bold{trial}  \tab \code{numeric}   \tab trial number \cr
\bold{author} \tab \code{character} \tab author(s) \cr
\bold{year}   \tab \code{numeric}   \tab publication year \cr
\bold{tpos}   \tab \code{numeric}   \tab number of TB positive cases in the treated (vaccinated) group \cr
\bold{tneg}   \tab \code{numeric}   \tab number of TB negative cases in the treated (vaccinated) group \cr
\bold{cpos}   \tab \code{numeric}   \tab number of TB positive cases in the control (non-vaccinated) group \cr
\bold{cneg}   \tab \code{numeric}   \tab number of TB negative cases in the control (non-vaccinated) group \cr
\bold{ablat}  \tab \code{numeric}   \tab absolute latitude of the study location (in degrees) \cr
\bold{alloc}  \tab \code{character} \tab method of treatment allocation (random, alternate, or systematic assignment)
}
}
\details{
   The 13 studies provide data in terms of \mjeqn{2 \times 2}{2x2} tables in the form:
   \tabular{lcc}{
                    \tab TB positive \tab TB negative \cr
   vaccinated group \tab \code{tpos} \tab \code{tneg} \cr
   control group    \tab \code{cpos} \tab \code{cneg}
   } The goal of the meta-analysis was to examine the overall effectiveness of the BCG vaccine for preventing tuberculosis and to examine moderators that may potentially influence the size of the effect.

   The dataset has been used in several publications to illustrate meta-analytic methods (see \sQuote{References}).
}
\source{
   Colditz, G. A., Brewer, T. F., Berkey, C. S., Wilson, M. E., Burdick, E., Fineberg, H. V., & Mosteller, F. (1994). Efficacy of BCG vaccine in the prevention of tuberculosis: Meta-analysis of the published literature. \emph{Journal of the American Medical Association}, \bold{271}(9), 698--702. \verb{https://doi.org/10.1001/jama.1994.03510330076038}
}
\references{
   Berkey, C. S., Hoaglin, D. C., Mosteller, F., & Colditz, G. A. (1995). A random-effects regression model for meta-analysis. \emph{Statistics in Medicine}, \bold{14}(4), 395--411. \verb{https://doi.org/10.1002/sim.4780140406}

   van Houwelingen, H. C., Arends, L. R., & Stijnen, T. (2002). Advanced methods in meta-analysis: Multivariate approach and meta-regression. \emph{Statistics in Medicine}, \bold{21}(4), 589--624. \verb{https://doi.org/10.1002/sim.1040}

   Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. \emph{Journal of Statistical Software}, \bold{36}(3), 1--48. \verb{https://doi.org/10.18637/jss.v036.i03}
}
\author{
   Wolfgang Viechtbauer, \email{wvb@metafor-project.org}, \url{https://www.metafor-project.org}
}
\examples{
### copy data into 'dat' and examine data
dat <- dat.bcg
dat

\dontrun{

### load metafor package
library(metafor)

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

### average risk ratio with 95\% CI
predict(res, transf=exp)

### mixed-effects model with absolute latitude and publication year as moderators
res <- rma(yi, vi, mods = ~ ablat + year, data=dat)
res

### predicted average risk ratios for 10-60 degrees absolute latitude
### holding the publication year constant at 1970
predict(res, newmods=cbind(seq(from=10, to=60, by=10), 1970), transf=exp)

### note: the interpretation of the results is difficult because absolute
### latitude and publication year are strongly correlated (the more recent
### studies were conducted closer to the equator)
plot(ablat ~ year, data=dat, pch=19, xlab="Publication Year", ylab="Absolute Lattitude")
cor(dat$ablat, dat$year)

}
}
\keyword{datasets}
\concept{medicine}
\concept{risk ratios}
\concept{meta-regression}
\section{Concepts}{
   medicine, risk ratios, meta-regression
}
