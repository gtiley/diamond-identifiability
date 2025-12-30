import re
import os
import subprocess

edges_counted = 0

diamond = ["d1", "d2", "d3", "d8", "d9"]
phi = "phi2"
ntrees = 1000
length = [250, 1000, 4000]

# Iterate through rooting methods

if edges_counted == 1:
    filename = f"simulationResults.error.txt"
    os.makedirs(filename, exist_ok=True)
    with open(filename, 'w') as out:
        # Write header line
        out.write("Diamond\tphi\tnTrees\tSeqLength\tReplicate\tNet0_lnL\tNet1_lnL\tNet2_lnL\tbest_h\tRF_dist\tHBS\tgamma\n")

# Iterate through diamonds
for i in range(5): # diamonds
    for k in range(3): # number of sequence length
        print(f"###{diamond[i]},{phi},ntrees:{ntrees},length:{length[k]}###")
        for l in range(20): # number of replicates
            rank = []
            minlnL = 1000000000
            minh = 9
            hw_distance = 9
            bsp = 0
            gamma = "NA"
            print(l)
            for n in range(3): # net number
                inputFile = f"snaqError/{diamond[i]}/{phi}_{ntrees}_{length[k]}/{l}/{l}.error.net{n}.true.snaq.out"
                with open(inputFile,'r') as input:
                    for line in input:
                        match = re.match(r"(.+;)\s+-Ploglik\s+=\s+(\S+)", line)
                        if match:
                            print("first match success")
                            net = match.group(1).replace(" ", "")
                            print(net)
                            lnL = float(match.group(2))
                            print(lnL)
                            rank.append(lnL)
                            if lnL < minlnL-2:
                                minlnL = lnL
                                minh = n
                            if n==1:
                                hybrid_edge = ""
                                hybrid_match = re.search(r"\S+\)(#H\d+):\S+", net)
                                if hybrid_match:
                                    hybrid_edge = hybrid_match.group(1)
                                    print(hybrid_edge)

                                statFile = f"snaqError/{diamond[i]}/{phi}_{ntrees}_{length[k]}/{l}/{i}.{k}.{l}.netStats.jl"
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
                                        out1.write(f"trueNet = readTopology(\"(({hybrid_edge},(C,D)),(E,(((A,B)){hybrid_edge},G)));\")\n")
                                    if i == 4:
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

                                if edges_counted == 0:
                                    bash_filename = f"snaqError/{diamond[i]}/{phi}_{ntrees}_{length[k]}/{l}/netStats.sh"
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
                                        out2.write(f"cd snaqError/{diamond[i]}/{phi}_{ntrees}_{length[k]}/{l}/\n")
                                        out2.write(f"julia {i}.{k}.{l}.netStats.jl  > {i}.{k}.{l}.netStats.txt\n")
                                    subprocess.run(["bash", bash_filename])
                                
                                elif edges_counted == 1:
                                    with open(f"snaqError/{diamond[i]}/{phi}_{ntrees}_{length[k]}/{l}/{i}.{k}.{l}.netStats.txt", 'r') as fh2:
                                        table_correct = False
                                        gamma = None
                                        for line in fh2:
                                            line = line.strip()
                                            if "Hardwired Cluster Distance =" in line:
                                                match = re.search(r"Hardwired\s+Cluster\s+Distance\s+=\s+(\d+)", line)
                                                if match:
                                                    hw_distance = int(match.group(1))
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
                                            print(f"Problem - Check output for {i} {k} {l}")
            if edges_counted == 1:
                out.write(f"{diamond[i]}\t{phi}\t{ntrees}\t{length[k]}\t{l}\t{rank[0]}\t{rank[1]}\t{rank[2]}\t{minh}\t{hw_distance}\t{bsp}\t{gamma}\n")
