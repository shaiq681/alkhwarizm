#' Find 'Greatest Common Divisor'(GCD) for two given numbers
#'
#' @param a A positive integer.
#' @param b A positive integer.
#' @return The GCD of \code{a} and \code{b}.
#' @examples
#' euclidean(10,100)
#' euclidean(123612, 13892347912)
#' @references \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#' @export


euclidean <- function(a,b){
  a = abs(a)
  b = abs(b)
  if (any(a != floor(a) | b != floor(b)))stop('The Input needs to be Real Integer')
  if (any(c(a,b)<0))stop('Please enter only positive Integers!')
  if (any((length(a) != 1) | (length(b) !=1)) )stop('Please enter a single integer')
  if (max(a,b)%%min(a,b) %in% NaN)stop('Invalid Input')
  if (max(a,b)%%min(a,b) == 0){
    return(min(a,b))
  }

  else{
    remainder = max(a,b)%%min(a,b)
    return(euclidean(a =min(a,b), b=remainder)) # Recursion
  }

}
