# "40 Years of Research on Eating Disorders - Bibliometrics and Network Analyses
# Carlos A. Almenara
# Created on November, 2020"

# Loading our library
library(bibliometrix)

# Setting the working directory
setwd("C:/temp")

# Loading our dataframe
df <- convert2df("eating_disorders_literature.csv", dbsource = "scopus", format = "csv")

# Changing authors' column name
df$Author <- df$CR_AU

###############################
#### BIBLIOMETRIC ANALYSIS ####
###############################
# Bibliometrics (descriptive analysis of our bibliographic dataset):
results <- biblioAnalysis(df, sep = ";")

summary(results, k = 20, pause = FALSE)


########################
### NETWORK ANALYSES ###
########################
# Collaboration network
colabnet <- biblioNetwork(df, analysis = "collaboration", network = "authors", sep = ";")

# Co-citation network
cocitnet <- biblioNetwork(df, analysis = "co-citation", network = "references", sep = ";")

# Plotting the networks
# NOTE: The plots in the article were made with 'biblioshiny'
# Below there is an example code to plot each network
plot1=networkPlot(colabnet, n = 100, Title = "Collaboration Network",  cluster = "louvain", 
                  type = "auto", size=T, remove.multiple=FALSE, labelsize=0.7, 
                  edges.min = 0, edgesize = 5, alpha = 0.5, verbose = TRUE,
                  remove.isolates = FALSE)
plot1


plot2=networkPlot(cocitnet, n = 50, Title = "Co-citation Network",  cluster = "louvain", 
                  type = "auto", size=T, remove.multiple=FALSE, labelsize=0.7, 
                  edgesize = 1)
plot2