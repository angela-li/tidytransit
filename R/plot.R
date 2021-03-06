#' Plot GTFS object routes and their frequencies
#'
#' @param x a gtfs_obj as read by read_gtfs()
#' @export
#' @param ... further specifications
#' @importFrom graphics plot
#' @importFrom dplyr select
#' @examples \donttest{
#' local_gtfs_path <- system.file("extdata", 
#'                               "google_transit_nyc_subway.zip", 
#'                               package = "tidytransit")
#' nyc <- read_gtfs(local_gtfs_path, 
#'                 local=TRUE)
#' plot(nyc)
#' }
plot.gtfs <- function(x, ...) {
  dots = list(...)
  routes_sf_frequencies <- x$routes_sf %>% 
    dplyr::inner_join(x$routes_frequency_df, by = "route_id") %>% 
    dplyr::select(median_headways, 
                   mean_headways, 
                   st_dev_headways, 
                   stop_count)
  
  plot(routes_sf_frequencies)
}

