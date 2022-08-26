initials() {
    local max_length="${2:-24}"
    local short="${1:-${(D)PWD}}"
    local head="${short%%/*}" # before the first /
    local tail="${short#*/}"  # after the first /
    local head_short="$head"

    while [[ "$tail" ]] && ((${#short} > max_length)); do
        local segment="${tail%%/*}"
        tail="${tail#*/}"
        if [[ "$segment" = "$tail" ]]; then
            break
        fi

        local segment_short="$segment"
        for ((i=${#segment}-3; i>=0; i--)); do
            local segment_prefix="$segment[0,$i]"
            local matching=(${(Q)~head}/${(Q)~segment_prefix}*(N))
            if ((${#matching[@]} != 1)); then
                break
            fi
            local segment_short="$segment_prefix*"
        done

        head="$head/$segment"
        head_short="$head_short/$segment_short"
        short="$head_short/$tail"
    done

    echo "$short"
}
