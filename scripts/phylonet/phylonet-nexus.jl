# Julia script to read a list of gene trees
# and create the NEXUS file for PhyloNet
# Claudia (January 2022)

# PhyloNet parameters
command = "InferNetwork_MPL" # phylonet command
numhyb = 1 # number of hybridizations allowed
netret = 1 # number of optimal networks to return (default 5)
numproc = 2 # number of processors to run computation in parallel
numruns = 10 # number of runs of the search (default 10)

# File with gene trees
treefile = "trees.txt"

# Output NEXUS file
rootname = split(treefile,'.')
outfile = string(rootname[1],"-phylonet.nex")

## Reading the gene trees
trees = readlines(treefile)

## Writing the NEXUS file
f = open(outfile, "w") ## this will overwrite the file if it exists
write(f,"#NEXUS \n\nBEGIN TREES;\n\n")

i = 0
for t in trees
    write(f,string("Tree gt",i,"= "))
    write(f,t)
    write(f,"\n")
    i += 1
end

write(f,"\nEND;\n\n\n")

## Writing PhyloNet command
write(f,"BEGIN PHYLONET;\n\n")
write(f,string(command," (all) ",numhyb, " -x ", numruns, " -n ", netret, " -pl ", numproc, ";"))
write(f,"\n\nEND;")
close(f)