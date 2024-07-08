topcharacter() {
    echo -e "|$1      |"
}

bottomcharacter() {
    echo -e "|      $1|"
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


print_characters A B c 4

