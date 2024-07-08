topcharacter() {
    if [[ ${#1} -eq 2 ]]; then
        echo -e "|$1     |"
    else
        echo -e "|$1      |"
    fi
}

bottomcharacter() {
    if [[ ${#1} -eq 2 ]]; then
        echo -e "|     $1|"
    else
        echo -e "|      $1|"
    fi
}

print_characters() {
    local top=' ------- '
    local side='|       |'
    local topout=''
    local topcharacter=''
    local bottomcharacter=''
    local blankside=''
    for character in "$@"
    do
        topout+="$top "
        topcharacter+="$(topcharacter $character) "
        blankside+="$side "
        bottomcharacter+="$(bottomcharacter $character) "
    done
    echo -e "$topout\n$topcharacter\n$blankside\n$blankside\n$blankside\n$bottomcharacter\n$topout"
}


print_characters K 2

