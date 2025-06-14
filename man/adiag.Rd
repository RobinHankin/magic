\name{adiag}
\alias{adiag}
\alias{adiag2}
\title{Binds arrays corner-to-corner}
\description{
  Array generalization of \code{blockdiag()}
}
\usage{
adiag(... , pad=as.integer(0), do.dimnames=TRUE)
adiag2(a, b, pad=as.integer(0), do.dimnames=TRUE)
}
\arguments{
  \item{a, b, ...}{Arrays to be joined}
  \item{pad}{Value to pad array with; note default keeps integer status
    of arrays}
  \item{do.dimnames}{Boolean, with default \code{TRUE} meaning to return
    dimnames if possible.  Set to \code{FALSE} if performance is an
    issue}
}
\details{

Function \code{adiag2()} binds two arrays together, corner-to-corner.
Function \code{adiag()} binds any number of arrays together.  Because
the function is associative provided \code{pad} is of length 1, this
page discusses the two array case implemented by \code{adiag2()}.

If the first argument is a list, it is interpreted as a list of arrays
to be bound together.

Suppose \code{x <- adiag(a,b)} and \code{dim(a)=c(a_1,...,a_d)},
\code{dim(b)=c(b_1,...,b_d)}.  Then we have
\code{all(dim(x)==dim(a)+dim(b))}; and \code{x[1:a_1,...,1:a_d]==a} and
\code{x[(a_1+1):(a_1+b_1),...,(a_d+1):(a_d+b_d)]==b}.



Dimnames are preserved, if both arrays have non-null dimnames, and
\code{do.dimnames} is \code{TRUE}.

Argument \code{pad} is usually a length-one vector, but any vector is
acceptable; standard recycling is used.  Be aware that the output array
(of dimension \code{dim(a)+dim(b)}) is filled with (copies of)
\code{pad} \emph{before} \code{a} and \code{b} are copied.  This can be
confusing.
  
}
\value{
Returns an array of dimensions \code{dim(a)+dim(b)} as described above.
}
\author{Peter Wolf with some additions by Robin Hankin}
\note{

In \code{adiag(a,b)}, if \code{a} is a length-one vector, it is coerced
to an array of dimensions \code{rep(1,length(dim(b)))}; likewise
\code{b}.  If both \code{a} and \code{b} are length-one vectors, return
\code{diag(c(a,b))}.

If \code{a} and \code{b} are arrays, function \code{adiag()} requires
\code{length(dim(a))==length(dim(b))} (the function does not guess which
dimensions have been dropped; see examples section).  In particular,
note that vectors are not coerced except if of length one.

\code{adiag()} is used when padding magic hypercubes in the context
of evaluating subarray sums.
}
\seealso{\code{\link{subsums}}, \code{\link{apad}}}
\examples{
 a <- array( 1,c(2,2))
 b <- array(-1,c(2,2))
 adiag(a,b)

 ## dropped dimensions can count:

 b2 <- b1 <- b
 dim(a) <- c(2,1,2)
 dim(b1) <- c(2,2,1)
 dim(b2) <- c(1,2,2)

 dim(adiag(a,b1))
 dim(adiag(a,b2))

## dimnames are preserved if not null:

a <- matrix(1,2,2,dimnames=list(col=c("red","blue"),size=c("big","small"))) 
b <- 8
dim(b) <- c(1,1)
dimnames(b) <- list(col=c("green"),size=c("tiny"))
adiag(a,b)   #dimnames preserved
adiag(a,8)   #dimnames lost because second argument has none.

## non scalar values for pad can be confusing:
q <- matrix(0,3,3)
adiag(q,q,pad=1:4)

## following example should make the pattern clear:
adiag(q,q,pad=1:36)


# Now, a use for arrays with dimensions of zero extent:
z <- array(dim=c(0,3))
colnames(z) <- c("foo","bar","baz")

adiag(a,z)        # Observe how this has
                  # added no (ie zero) rows to "a" but
                  # three extra columns filled with the pad value

adiag(a,t(z))
adiag(z,t(z))     # just the pad value

}

\keyword{array}
