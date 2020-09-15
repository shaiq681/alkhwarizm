#' @title The wiki_graph dataset
#'
#' @description The wiki_graph dataset
#'
#'
#' The wiki_graph is a dataset that has 18 observation and 3 variables.
#' The name of the variables are "v1","v2" and "w". These repesent the nodes
#' and the weight of each node.
#'
#' The wiki_graph can be used with the \code{\link{dijkstra}} function.
#'
#' @source \url{http://en.wikipedia.org/wiki/Dijkstras_algorithm}

wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))

usethis::use_data(wiki_graph, overwrite = TRUE)
