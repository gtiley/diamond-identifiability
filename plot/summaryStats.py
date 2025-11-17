import os

diamonds = ["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9"]
phi_name = ["phi1","phi2","phi3"]
phi_val = ["0.5","0.25","0.05"]
ntrees = ["250", "1000", "4000"]
length = 1000

for i in range(3):
    res = {}
    header = []
    input_filename = "simulationResults.true.txt" # there are 11 columns in this table

    # Read the input file
    with open(input_filename, 'r') as fh:
        for line in fh:
            line = line.strip()
            if line.startswith("Diamond"):
                header = line.split("\t")
                # find the header which is the line start with "Diamond"
            else:
                temp = line.split("\t")
                diamond, tree_count = temp[0], temp[2]
                # find the column with variable diamond and the number of gene trees
                hybrid_rate = temp[1]
                # the variable representing the value of phi, but in the form phi1,phi2,phi3

                if hybrid_rate == phi_name[i]:
                    if diamond not in res:
                        res[diamond] = {}
                    if tree_count not in res[diamond]:
                        res[diamond][tree_count] = {}

                    # header[8] is the 9th column, best_h
                    if header[8] not in res[diamond][tree_count]:
                        temp[8] = "0" if temp[8] != "1" else temp[8]
                        # if best_h is not 1, set it to 0, if equals to 1 then 1
                        res[diamond][tree_count][header[8]] = int(temp[8])
                        res[diamond][tree_count][header[9]] = int(temp[9] > "0")
                        # header[9] RF_dist
                        res[diamond][tree_count][header[10]] = int(temp[10])
                        # header[10] HBS
                    else:
                        temp[8] = "0" if temp[8] != "1" else temp[8]
                        res[diamond][tree_count][header[8]] += int(temp[8])
                        res[diamond][tree_count][header[9]] += int(temp[9] > "0")
                        res[diamond][tree_count][header[10]] += int(temp[10])
                    
                    print(res)

    # Write the output file
    output_filename = f"{phi_val[i]}.True.resultForPlotting.txt"
    with open(output_filename, 'w') as out:
        out.write("Diamond\tnTrees\txPos\tFoundOneEdge\tCorrectNetwork\tHasHybridEdge\n")
        
        for j in range(len(diamonds)):
            xp = j + 1 + 0.1
            for k in range(len(ntrees)):
                diamond = diamonds[j]
                tree_count = ntrees[k]
                
                foe = res[diamond][tree_count][header[8]] # FoundOneEdge is the count of best_h==1
                pc = 20 - res[diamond][tree_count][header[9]]
                hhe = res[diamond][tree_count][header[10]]

                if k == 0:
                    xp -= 0.4
                elif k > 0:
                    xp += 0.2

                out.write(f"{diamond}\t{tree_count}\t{xp}\t{foe}\t{pc}\t{hhe}\n")