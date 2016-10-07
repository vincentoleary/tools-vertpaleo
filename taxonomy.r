library(ape)
library(viridisLite)
library(ggtree)


# Build cladogram from csv file of taxonomy
foo <- data.frame(read.csv("vp_taxa.csv"))
foophylo <- as.phylo(~clade1/clade2/clade3/order/family/genus/species, data = foo)

# Export cladogram
write.tree(foophylo, file="vp_tree.tre")

# Plot cladogram with ggtree package
footree <-read.tree(file = "vp_tree.tre")
tree <- ggtree(footree, color="white", layout="circular") + geom_nodepoint(color=inferno(117), alpha=1/3, size=7) + geom_tiplab2(size=3, color=(280), aes(angle=angle)) + theme_tree("black")
tree

# Color by taxonmic groups
p <- split(footree$tip.label, gsub("_\\w+", "", footree$tip.label))
pgroup <- groupOTU(footree, p)
tree2 <- ggtree(pgroup, aes(color=group), color=viridis(374), layout='circular') + geom_tiplab(size=3, color=viridis(279), aes(angle=angle)) + theme_tree("black")
tree2

# STILL WORKING ON


### Highlight clades
### Select by node number
ggtree(foo, layout="circular") + geom_text2(aes(subset=!isTip, label=node)) + geom_tiplab(size=1.5, aes(angle=angle))
### Color by node
ggtree(tree, layout="circular") + geom_hilight(node=, fill=inferno(256), alpha=.6) +
    geom_hilight(node=, fill=inferno(256), alpha=.6)
### Add labels by each nodep <- ggtree(tree) + xlim(NA, 6)
p+geom_cladelabel(node=45, label="test label") +
    geom_cladelabel(node=34, label="another clade") 