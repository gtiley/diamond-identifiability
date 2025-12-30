import os

diamonds = ["d1", "d2", "d3", "d8", "d9"]
phi_name = "phi2"
phi_val = "0.25"
ntrees = "1000"
length = ["250", "1000", "4000"]


res = {}
header = []
input_filename = "simulationResults.error.txt"

# Read the input file
with open(input_filename, 'r') as fh:
    for line in fh:
        line = line.strip()
        if line.startswith("Diamond"):
            header = line.split("\t")
        else:
            temp = line.split("\t")
            diamond, seq_len = temp[0], temp[3]

            if diamond not in res:
                res[diamond] = {}
            if seq_len not in res[diamond]:
                res[diamond][seq_len] = {}

            if header[8] not in res[diamond][seq_len]:
                temp[8] = "0" if temp[8] != "1" else temp[8]
                res[diamond][seq_len][header[8]] = int(temp[8])
                res[diamond][seq_len][header[9]] = int(temp[9] > "0")
                res[diamond][seq_len][header[10]] = int(temp[10])
            else:
                temp[8] = "0" if temp[8] != "1" else temp[8]
                res[diamond][seq_len][header[8]] += int(temp[8])
                res[diamond][seq_len][header[9]] += int(temp[9] > "0")
                res[diamond][seq_len][header[10]] += int(temp[10])
            
            print(res)

# Write the output file
output_filename = "Error.resultForPlotting.txt"
with open(output_filename, 'w') as out:
    out.write("Diamond\tSeqLen\txPos\tFoundOneEdge\tCorrectNetwork\tHasHybridEdge\n")
    
    for j in range(len(diamonds)):
        xp = j + 1 + 0.1
        for k in range(len(length)):
            diamond = diamonds[j]
            seq_len = length[k]
            
            foe = res[diamond][seq_len][header[8]]
            pc = 20 - res[diamond][seq_len][header[9]]
            hhe = res[diamond][seq_len][header[10]]

            if k == 0:
                xp -= 0.4
            elif k > 0:
                xp += 0.2

            out.write(f"{diamond}\t{seq_len}\t{xp}\t{foe}\t{pc}\t{hhe}\n")