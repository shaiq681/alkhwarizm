#'@title An implementation of Dijkstra's Algorithm
#'
#'@description This is a generic implementation of Dijkstra's algorithm on edges with predefines weights.
#'
#'@param graph data.table with three columns as 'v1', 'v2', and 'v3'.
#'@param init_node Numeric, name of the edge. NOTE: Edge should be available in graph.
#'
#'@return Minimum cost for each node wrt init_node.
#'
#'@examples
#'
#'wiki_graph <-
#'data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#'
#'dijkstra(wiki_graph,1)
#'
#'dijkstra(wiki_graph,3)
#'
#'@references \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#'@export

dijkstra = function(graph, init_node){

  if (class(graph) != 'data.frame')stop('graph need to be a DataFrame')
  if (dim(graph)[2] != 3) stop('Invalid Graph Input')
  if (!all(names(graph) %in% c('v1','v2','w')))stop('Add valid column names')
  if (any(is.na(cbind(graph, init_node))))stop("Input values cannot be NA's!")
  if (any(lapply(graph[3], FUN = is.numeric) == FALSE))stop('Weights should be Integers')
  if (!is.numeric(init_node))stop('Initial node should be a valid input')
  if (!(init_node %in% unique(unlist(graph[,1:2]))))stop('Initial node not present in the dataframe')

  else{
    # Initial setup
    init_node <- init_node
    unique_nodes <- unique(graph[,1])

    init_matrix <- matrix(Inf,
                          nrow = nrow(unique(graph[,1:2])),
                          ncol = nrow(unique(graph[,1:2])))

    for(i in 1:nrow(graph[1])){
      init_matrix[graph[2][i,],graph[1][i,]] <- graph[3][i,]
    }

    # Creating the cost vectors
    cost <- rep(Inf,times = length(unique_nodes))

    cost[init_node] <- 0 # Initialize lowest cost to itself

    # Loop to process until all nodes are covered
    while(length(unique_nodes) != 0){
      idx <- which.min(cost[unique_nodes])
      u <- unique_nodes[idx]

      # Loop to go through all the neighbours of the current node
      for(neighbour in unique_nodes){
        new_cost <- cost[u] + init_matrix[u,neighbour] # Update cost if its cheaper.
        if(new_cost < cost[neighbour]){
          cost[neighbour] <- new_cost
        }
      }
      unique_nodes <- unique_nodes[-idx] # Remove the node for which cost has been computed.
    }
    return(cost)
  }

}
