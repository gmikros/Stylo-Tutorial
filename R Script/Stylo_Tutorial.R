#Installing stylo
# run R
# type
install.packages("stylo")

# pick your R server
# click OK
# done!

# Some basic R functions, just in case
# to activate a package: 
library(stylo)

# to set working directory: 
setwd("path/to/my/stuff")

# to find your current location: 
getwd()

# to list files in your current location: 
list.files()

# to get help: help(<function>)
help(stylo)

# to quit R: 
q()

# Main functions: stylo()
# It computes distances (differences) between texts, …
# … represented as rows of frequencies of most frequent words.
# Then it plots graphs of those distances:
  # Cluster Analysis plots (dendrograms)
  # Multidimensional Scaling scatterplots
  # Principal Components Analysis scatterplots
  # Bootstrap Consensus Trees plots (for multiple parameter settings)
  # Bootstrap Consensus Networks (other software will be needed to take over)
# The plots can be both displayed on screen and saved to a file (e.g. PNG).

# Functions: stylo.network()
# It is an extended version of the function stylo().
# It performs Bootstrap Consensus Networks, or a network-like generalization of the Bootstrap Consensus Trees method.
# It produces interactive visualizations in a web browser: to make it happen, you have to install an additional 
# R package first. Type: 
install.packages("networkD3")

# Main functions: classify()
# It trains a model for pre-defined groups of texts, e.g. authors.
# Then it computes distances (differences) between texts, …
# … represented as rows of frequencies of most frequent words.
# Finally, it compares the trained models with test texts, using:
  # Delta classifier (lazy learner introduced by Burrows)
  # k-NN classifier (lazy learner relying on >1 neighbors)
  # Suppor Vector Machines, a high-performance non-probabilistic classifier
  # Naive Bayes, a classical yet slightly outdated classifier
  # Nearest Shrunken Centroids, a classifier for high-dimensional datasets
# A final report of the classifier’s performance is outputted.

# Main functions: oppose()
# Designed to compare two (groups of) texts
# It cuts input texts into equal-sized samples
# Finds words characteristic for two (groups) of texts
  # These can be reused with stylo() or classify()
# Produces a diagram of the use of each group’s words

# Functions: rolling.classify()
# Looks for traces of authors in a co-authored text…
# … by sliding through this text sequentially in order to detect peculiarities.
# Produces a graph of the respective strengths of these traces.

# Preparing a corpus
# before you launch R, …
# in your favourite folder, create a subfolder named corpus
# put your raw text files there, e.g.:
  # Roidis_Diigimata.txt
  # Vikelas_Diigimata .txt
# to be on the safe side - make sure your files are in UTF-8, especially if the language 
# of your corpus contains diacritics!

# Running stylo()
# activate the package
# type 
library(stylo)
# navigate to your favourite folder:
  # geeks: 
setwd("the/path/to/my/favourite/folder")
  # RStudio users: find your directory in the Files panel, then use Menu > More > Set as Working Directory
  # Windows users: use Menu > File > Change directory
  # MacOS users: use Menu > Misc > Change working directory
# launch the main function:
#   type 
stylo()

# Bootstrap Consensus Networks
# There are two ways of computing a stylometric network:
# interactive:
  # run the function 
stylo.network()
  # set the parameters as for Bootstrap Consensus Networks
  # a web browser will start automatically: your network is there!
# static, yet highly customizable:
# run the function stylo(network = TRUE)
# find a file named ..._C_0.5_EDGES.csv in your working directory
# load it into a network manipulation tool, e.g. Gephi

# Running oppose()
# Different subfolder structure:
  # primary_set
  # secondary_set
  # test_set (optional)
# Running the function:
library(stylo)
oppose(encoding = "UTF-8", corpus.lang = "Other")

# What we get:
  # words_preferred.txt characteristic for the primary_set texts
  # words_avoided.txt characteristic for the secondary_set texts
  # word frequency graph
