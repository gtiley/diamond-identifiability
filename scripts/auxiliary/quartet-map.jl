# Julia script to map quartets on one network
# to quartets in a different network
# Claudia February 2022

function mapNright2Ndown(n)
    length(n) == 4 || error("n should correspond to a quartet and should have length of 4")
    return [n[3],n[1],n[4],n[2]]
end

function mapNleft2Ndown(n)
    length(n) == 4 || error("n should correspond to a quartet and should have length of 4")
    return [n[2],n[4],n[1],n[3]]
end

function mapNup2Ndown(n)
    length(n) == 4 || error("n should correspond to a quartet and should have length of 4")
    return [n[4],n[3],n[2],n[1]]
end