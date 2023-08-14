# Function to install packages if not already installed
install_if_missing <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package)
  }
  library(package, character.only = TRUE)
}
# Install and load required packages
install_if_missing("httr")
install_if_missing("jsonlite")


get_factorial <- function() {
  url <- "http://localhost:8000/factorial/5"
  response <- GET(url)
  
  if (status_code(response) != 200) {
    cat("Error: Expected status code 200, got", status_code(response), "\n")
    return(FALSE)
  }
  
  json_data <- fromJSON(content(response, "text"))
  
  if (json_data$factorial != 120) {
    cat("Error: Expected factorial value 120, got", json_data$factorial, "\n")
    return(FALSE)
  }
  
  return(TRUE)
}

if (get_factorial()) {
  cat("Test passed.\n")
} else {
  cat("Test failed.\n")
}

