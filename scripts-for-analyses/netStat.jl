using PhyloNetworks
trueNet = readTopology("((#H7,C),((E,F),((A)#H7,(G,H))));")
estNet = readTopology("(C,((E,F):1.9073645027284403,(G,(H,#H7:::0.014189015628678648):0.6796950605873654):2.0501267367281084):1.6762048982986533,(A)#H7:::0.9858109843713213);")
try
   	rootatnode!(estNet, "C")
catch
     	println("Rooting of estimated network not possible")
end
rootatnode!(trueNet, "C")
d = hardwiredClusterDistance(estNet, trueNet, true)
println("Hardwired Cluster Distance = ", d)
estArray = [estNet]
BSn, BSe, BSc, BSgam, BSedgenum = hybridBootstrapSupport(estArray, trueNet)
if BSgam[1] == 0.0 & BSgam[2] != 0.0
    BSgam[1] = 1 - BSgam[2]
elseif BSgam[1] != 0.0 & BSgam[2] == 0.0
	BSgam[2] = 1 - BSgam[1]
end
println("Begin Bootstrap nodes")
println(BSn)
println("End Bootstrap nodes")
println("Begin Bootstrap edges")
println(BSe)
println("End Bootstrap edges")
println("Begin Adjacency Matrix")
println(BSc)
println("End Adjacency Matrix")
println("gamma = ", BSgam)
println("edge number = ", BSedgenum)