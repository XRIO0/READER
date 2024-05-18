#!/bin/bash
display_logo() {
    local logo="\
 __  __ ___ ____ ____   __  __  ____  ___ ___
 |  \/  |_ _/ ___/ ___|  \ \/ / |  _ \|_ _/ _ \\
 | |\/| || |\___ \\___ \\   \  /  | |_) || | | | |
 | |  | || | ___) ___) |  /  \\  |  _ < | | |_| |
 |_|  |_|___|____|____/  /_/\\_\\ |_| \\_|___\\___/
                                    version:- 1.0
                                    ENDING:) 19-may-2024
                           https://github.com/XRIO0
NOTE:- READ THE README.txt FOR OPTION AND USE
 "

    local delay=0.0001
    for (( i=0; i<${#logo}; i++ )); do
        echo -n "${logo:$i:1}"
        sleep "$delay"
    done
    echo
}

display_logo

show_help() {
    echo "Usage: $0 -i <input_folder> -t <log_file_name>"
    echo "This tool read all folder and inside content in one click "
    echo "Options:"
    echo "  -i    Input folder name"
    echo "  -t    Log file name to search for"
    echo "  -h    Display this help message"
}

while getopts "hi:t:" opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        i)
            input_folder="$OPTARG"
            ;;
        t)
            log_file_name="$OPTARG"
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
done

if [ -z "$input_folder" ] || [ -z "$log_file_name" ]; then
    echo "Error: Missing required arguments."
    show_help
    exit 1
fi

if [ ! -d "$input_folder" ]; then
    echo "Error: Input folder $input_folder does not exist!"
    exit 1
fi

cd "$input_folder" || exit

border_counter=1

find . -type f -name "$log_file_name" | while read -r log_file; do
    echo "$border_counter. "
    echo "Processing log file: $log_file"
    echo "------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Log file: $log_file"
    echo "------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "-----------------------------------------------------------------------------------------------------------------------------------------------"

    cat "$log_file"
    echo "-----------------------------------------------------------------------------------------------------------------------------------------------"
    echo ""
    ((border_counter++))
done
