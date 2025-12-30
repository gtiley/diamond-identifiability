# Generate control files under phi1 = 0.5 with template1
import os
import random

nloci = [250, 1000, 4000]
length = [250, 1000, 4000]

for i in range(3):
    for j in range(3):
        os.mkdir(f"phi1_{nloci[i]}_{length[j]}")
        for k in range (100):
            seed = random.randint(0, 1000000000)
            os.mkdir(f"phi1_{nloci[i]}_{length[j]}/{k}")
            seqPath = f"phi1_{nloci[i]}_{length[j]}/{k}/{k}.seq"
            treesPath = f"phi1_{nloci[i]}_{length[j]}/{k}/{k}.trees"
            concatPath = f"phi1_{nloci[i]}_{length[j]}/{k}/{k}.concat"
            with open(f"phi1_{nloci[i]}_{length[j]}/{k}/{k}.ctl", 'w') as outfile:
                with open("template1.ctl", 'r') as template:
                    for line in template:
                        line = line.rstrip('\n')
                        line = line.replace("__SEED__", str(seed))
                        line = line.replace("__SEQFILE__", seqPath)
                        line = line.replace("__TREEFILE__", treesPath)
                        line = line.replace("__CONCATFILE__", concatPath)
                        line = line.replace("__NLOCI__", str(nloci[i]))
                        line = line.replace("__LENGTH__", str(length[j]))

                        outfile.write(f"{line}\n")