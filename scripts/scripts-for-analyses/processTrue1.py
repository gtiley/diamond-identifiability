import re
import os
import subprocess

edges_counted = 1

diamond = ["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9"]
phi = ["phi1","phi2","phi3"]
ntrees = [250,1000,4000]
length = 1000

# Iterate through rooting methods

if edges_counted == 1:
    filename = "simulationResults.true.txt"
    with open(filename, 'w') as out:
        # Write header line
        out.write("Diamond\tphi\tnTrees\tSeqLength\tReplicate\tNet0_lnL\tNet1_lnL\tNet2_lnL\tbest_h\tRF_dist\tHBS\tgamma\n")

# Iterate through diamonds
for i in range(9): # diamonds
    for j in range(3): # phi
        for k in range(3): # number of trees
            print(f"###{diamond[i]},{phi[j]},ntrees:{ntrees[k]},length:{length}###")
            for l in range(20): # number of replicates
                rank = []
                minlnL = 1000000000
                minh = 9
                hw_distance = 9
                bsp = 0
                gamma = "NA"
                print(l)
                
                for n in range(3): # net number
                    inputFile = f"snaq/{diamond[i]}/{phi[j]}_{ntrees[k]}_{length}/{l}/{l}.net{n}.true.snaq.out"
                    with open(inputFile,'r') as input:
                        for line in input:
                            match1 = re.match(r"(.+;)\s+-Ploglik\s+=\s+(\S+)", line)
                            if match1:
                                #print("first match success")
                                net = match1.group(1).replace(" ", "")
                                #print(net)
                                lnL = float(match1.group(2))
                                #print(lnL)
                                rank.append(lnL)
                                if lnL < minlnL-2:
                                    minlnL = lnL
                                    minh = n
                                if n==1:
                                    # n==1 means we find one edge
                                    hybrid_edge = ""
                                    hybrid_match = re.search(r"\S+\)(#H\d+):\S+", net)
                                    if hybrid_match:
                                        hybrid_edge = hybrid_match.group(1)
                                        print(hybrid_edge)
                                if edges_counted == 0:
                                    statFile = f"snaq/{diamond[i]}/{phi[j]}_{ntrees[k]}_{length}/{l}/{i}.{j}.{k}.{l}.netStats.jl"
                                    os.makedirs(os.path.dirname(statFile), exist_ok=True)
                                    with open(statFile, 'w') as out1:
                                        out1.write("using PhyloNetworks\n")
                                        if i == 0:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),((E,F),(((A,B)){hybrid_edge},(G,H))));\")\n")
                                        if i == 1:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),((E,F),((A){hybrid_edge},(G,H))));\")\n")
                                        if i == 2:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},C),((E,F),(((A,B)){hybrid_edge},(G,H))));\")\n")
                                        if i == 3:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),(E,(((A,B)){hybrid_edge},(G,H))));\")\n")
                                        if i == 4:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),((E,F),(((A,B)){hybrid_edge},G)));\")\n")
                                        if i == 5:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},C),((E,F),((A){hybrid_edge},(G,H))));\")\n")
                                        if i == 6:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},C),(E,(((A,B)){hybrid_edge},(G,H))));\")\n")
                                        if i == 7:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),(E,(((A,B)){hybrid_edge},G)));\")\n")
                                        if i == 8:
                                            out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),((E,F),((A){hybrid_edge},G)));\")\n")
                                        out1.write(f"estNet = readTopology(\"{net}\")\n")
                                        out1.write("try\n")
                                        out1.write("\trootatnode!(estNet, \"C\")\n")
                                        out1.write("catch\n")
                                        out1.write("\tprintln(\"Rooting of estimated network not possible\")\n")
                                        out1.write("end\n")
                                        out1.write("rootatnode!(trueNet, \"C\")\n")
                                        out1.write("d = hardwiredClusterDistance(estNet, trueNet, true)\n")
                                        out1.write("println(\"Hardwired Cluster Distance = \", d)\n")
                                        out1.write("estArray = [estNet]\n")
                                        out1.write("BSn, BSe, BSc, BSgam, BSedgenum = hybridBootstrapSupport(estArray, trueNet)\n")
                                        out1.write("println(\"Begin Bootstrap nodes\")\n")
                                        out1.write("println(BSn)\n")
                                        out1.write("println(\"End Bootstrap nodes\")\n")
                                        out1.write("println(\"Begin Bootstrap edges\")\n")
                                        out1.write("println(BSe)\n")
                                        out1.write("println(\"End Bootstrap edges\")\n")
                                        out1.write("println(\"Begin Adjacency Matrix\")\n")
                                        out1.write("println(BSc)\n")
                                        out1.write("println(\"End Adjacency Matrix\")\n")
                                        out1.write("println(\"gamma = \", BSgam)\n")
                                        out1.write("println(\"edge number = \", BSedgenum)\n")

                                    #if edges_counted == 0:
                                        bash_filename = f"snaq/{diamond[i]}/{phi[j]}_{ntrees[k]}_{length}/{l}/netStats.sh"
                                        os.makedirs(os.path.dirname(bash_filename), exist_ok=True)
                                        with open(bash_filename, 'w') as out2:
                                            out2.write("#!/bin/bash\n")
                                            out2.write("#SBATCH --mail-user=g.tiley@kew.org\n")
                                            out2.write("#SBATCH --mail-type=FAIL\n")
                                            out2.write("#SBATCH --time=24:00:00\n")
                                            out2.write("#SBATCH --mem-per-cpu=1000M\n")
                                            out2.write("#SBATCH --nodes=1\n")
                                            out2.write("#SBATCH --ntasks=1\n")
                                            out2.write("#SBATCH --cpus-per-task=1\n")
                                            out2.write("#SBATCH --partition=short\n")
                                            #out2.write("module load gcc\n")
                                            out2.write(f"cd snaq/{diamond[i]}/{phi[j]}_{ntrees[k]}_{length}/{l}/\n")
                                            out2.write(f"julia {i}.{j}.{k}.{l}.netStats.jl  > {i}.{j}.{k}.{l}.netStats.txt\n")
                                        subprocess.run(["bash", bash_filename])
                                    
                                elif edges_counted == 1:
                                    with open(f"snaq/{diamond[i]}/{phi[j]}_{ntrees[k]}_{length}/{l}/{i}.{j}.{k}.{l}.netStats.txt", 'r') as fh2:
                                        table_correct = False
                                        gamma = None
                                        for line in fh2:
                                            line = line.strip()
                                            if "Hardwired Cluster Distance =" in line:
                                                match2 = re.search(r"Hardwired\s+Cluster\s+Distance\s+=\s+(\d+)", line)
                                                if match2:
                                                    hw_distance = int(match2.group(1))
                                            if re.match(r".+H\d+.+", line):
                                                temp = line.split()
                                                if len(temp) == 11 and temp[10] == "100.0":
                                                    bsp = 1
                                                    table_correct = True
                                            gamma_match = re.search(r"gamma\s+=\s+\[(\d+\.\d+)\s+(\d+\.\d+)\]", line)
                                            if gamma_match:
                                                g1, g2 = map(float, gamma_match.groups())
                                                gamma = min(g1, g2) if g1 != 0.0 else None
                                        
                                        if not table_correct:
                                            print(f"Problem - Check output for {i} {j} {k} {l}")
                if edges_counted == 1:
                    with open(filename, 'a') as out:
                        out.write(f"{diamond[i]}\t{phi[j]}\t{ntrees[k]}\t{length}\t{l}\t{rank[0]}\t{rank[1]}\t{rank[2]}\t{minh}\t{hw_distance}\t{bsp}\t{gamma}\n")

            
