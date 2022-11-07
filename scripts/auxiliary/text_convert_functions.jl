# Script by Bella Wu to convert Macaulay2 output to latex
# Originally file split into text_convert.jl (examples) and text_convert_functions.jl (functions)
# https://github.com/solislemuslab/phylo-invariants/blob/master/scripts/julia/text_convert.jl
# October 2022


# Claudia: calculate the degree of the polynomials
# str: line of the exponents
function polynomialDegree(exp)
    exp2 = replace(exp, " "=> "-")
    exp3 = split(exp2, "--------------")
    deleteat!(exp3, findall(x->x=="",exp3))

    mx = 0
    for e in exp3
        tmp = split(e,'-')
        deleteat!(tmp, findall(x->x=="",tmp))
        s = sum(parse.(Int,tmp))
        if s>mx
            mx = s
        end
    end
    return mx
end


"""
    input:  a list of invariants separated by comma (eg. "a22 + 2a24 - 1, a8 - a9, a7 + 2a9 - 1")
    output: returns arraylist of strings (eg. ["a22 + 2a24 - 1", "a8 - a9", "a7 + 2a9 - 1"])
"""
function comma_sep(str)
    temp = split(str, ",") #split the string on comma
    ret = [] #storing return value
    for ele in temp #iterate through each element
        if length(ele) > 0 #neglect the empty element
            push!(ret, strip(ele, [' '])) #remove the first tab
        end
    end
    return ret
end

"""
    input:  returns arraylist of strings (eg. ["a22 + 2a24 - 1", "a8 - a9", "a7 + 2a9 - 1"])
    output: a list of invariants separated by comma (eg. "a22 + 2a24 - 1, a8 - a9, a7 + 2a9 - 1")
"""
function arr_sep(arr)
    ans = ""
    for i in 1:(length(arr)-1)
        ans = ans*arr[i]*", "
    end
    return ans*arr[end]
end

"""
    input:  invariants separated by comma (eg. "a32^2 - a33, a31 + 2a33^2*a45 - 1, a28 + a29 + a30 - 1, a23 - a24, a22 + 2a24 - 1")
    output: string 
    (eg. "\\item \$
    a_{32}^{2} - a_{33}\$
    \\item \$
     a_{31} + 2a_{33}^{2}*a_{45} - 1\$
    \\item \$
     a_{28} + a_{29} + a_{30} - 1\$
    \\item \$
     a_{23} - a_{24}\$
    \\item \$
     a_{22} + 2a_{24} - 1\$")
"""
function latex_add_item(str)
    temp = split(str, ",") #split the string on comma
    ret = [] #storing return value
    for ele in temp #iterate through each element
        if length(ele) > 0 #neglect the empty element
            push!(ret, "\\item \$\n"*ele*"\$\n")
        end
    end
    return join(ret)
end

"""
    input:  str: strings of the macaulay version invariants
                 before the newline is the invariants without exponent,
                 after the newline is the string of exponent, the position is the same in invariants
                 eg. macaulay_latex("a5*a29 + 2a5*a30 - a5 + a20 - a26, 2a20*a29 a41\n                                           3", true)
            exp: true if there is exponent
                  
    output: strings of the latex version invariants
            eg. a_{5}*a_{29} + 2a_{5}*a_{30} - a_{5} + a_{20} - a_{26}, 2a_{20}*a_{29}^{3}*a_{41}
"""
function macaulay_latex(str, exp)
    if exp
        temp = split(str, "\n")
        str = temp[1] #storing invariants
        exp = temp[2] #storing exponents
        j = 0 #store index in str
        for i in 1:length(exp)
            j += 1
            @show i
            @show j
            if exp[i] != ' ' && str[j] == ' ' && str[j+1] != 'z'
                str=str[1:j-1]*'^'*exp[i]*str[j+1:end]
                j+=1
            elseif exp[i] != ' ' && str[j] == ' ' && str[j+1] == 'z'
                str=str[1:j-1]*'^'*exp[i]*'*'*str[j+1:end]
                j+=2
            end
            
        end
    end

    temp = split(str, "z") #split the element on "z"
    #iterate through every segment of the element after splitting
    for i in 1:length(temp)
        #if temp[i] is not empty, 
        #add "a_{}" around the index, add "{}" around the exponent
        #eg. "a32^2-a33" --> ["", "32^2-", "33"] --> ["", "a_{32}^{2}-", "a_{33}"]
        if length(temp[i]) > 0
            #iterate though every character of the segment (temp[i][j])
            for j in 1:length(temp[i])
                #if the character is not a number and is the first occurance of non-number
                if !occursin(r"[0-9]", string(temp[i][j])) 
                    #add "}" in between the number and the non-number character
                    temp[i] = temp[i][1:j-1]*"}"*temp[i][j:length(temp[i])]
                    break
                #if the character is number and is the last character of the segment
                elseif occursin(r"[0-9]", string(temp[i][j])) && (j == length(temp[i]))
                    temp[i] = temp[i][1:j]*"}" #add "}" to the end
                end
            end
            for j in 1:length(temp[i]) #handle the exponent
                if occursin(r"[\^]", string(temp[i][j]))
                    if length(temp[i])> j+1
                        temp[i] = temp[i][1:j]*"{"*temp[i][j+1]*"}"*temp[i][j+2:length(temp[i])]
                    else
                        temp[i] = temp[i][1:j]*"{"*temp[i][j+1]*"}"
                    end
                end
            end
            temp[i] = "z_{"*temp[i] #add "a_{" to the front
        end
    end
    return join(temp)
end

"""
    input:  strings of the latex version invariants
        eg. "a_{32}^{2} - a_{33}, a_{31} + 2a_{33}^{2}*a_{45} - 1, a_{28} + a_{29} + a_{30} - 1, a_{23} - a_{24}, a_{22} + 2a_{24} - 1"
    output: strings of the macaulay version invariants
        eg. "a32^2 - a33, a31 + 2a33^2*a45 - 1, a28 + a29 + a30 - 1, a23 - a24, a22 + 2a24 - 1"
"""
function latex_macaulay(str)
    ret = replace(str, r"[{}_]" => "")
    return ret
end

"""
    input:  strings of the latex version invariants
        eg. "a_{32}^{2} - a_{33}, a_{31} + 2a_{33}^{2}*a_{45} - 1, a_{28} + a_{29} + a_{30} - 1, a_{23} - a_{24}, a_{22} + 2a_{24} - 1"
    output: strings of the julia version invariants
        eg. "a[32]^2 - a[33], a[31] + 2a[33]^2*a[45] - 1, a[28] + a[29] + a[30] - 1, a[23] - a[24], a[22] + 2a[24] - 1"
    
    BUG: 3a8*a30 + a8 - a23 - a32 wrong output
"""
function latex_julia(str)
    ret = []
    temp = replace(str, "{" => "[")
    temp = replace(temp, "}" => "]")
    temp = replace(temp, "_" => "")
    temp = split(temp, "^")
    for i in 1:length(temp)
        if length(temp[i]) > 0
            if length(temp[i]) > 3
                if temp[i][1] == '[' && temp[i][3] == ']' && temp[i][4] == 'a'
                    temp[i] = "^"*temp[i][2]*"*"*temp[i][4:length(temp[i])]
                elseif temp[i][1] == '[' && temp[i][3] == ']' && temp[i][4] != 'a'
                    temp[i] = "^"*temp[i][2]*temp[i][4:length(temp[i])]
                end
            else 
                if temp[i][1] == '[' && temp[i][3] == ']' 
                    temp[i] = "^"*temp[i][2]*temp[i][4:length(temp[i])]
                end
            end
        end
        push!(ret, temp[i])
    end
    return join(ret)
end