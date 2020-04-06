#!/bin/sh

LAST_FILE=245
DATA_DIR="data"
CURL_OPTIONS=""
FILE_PREFIX="F"
BASE_URL="https://www.cs.helsinki.fi/u/puglisi/PFP2020/assignment1/F"

# Create directory named 'data' in current working directory (if it doesn't exist)
if [[ ! -d $DATA_DIR ]]
then
    mkdir $DATA_DIR
    echo "Created folder '$DATA_DIR' in current working directory"
fi

download_file()
{
    ARG=$1
    if [ $ARG -gt $LAST_FILE -o $ARG -lt 0 ]
    then
        echo "File $FILE_PREFIX$ARG does not exist on server"
    elif [[ -f "data/$FILE_PREFIX$ARG" ]]
    then
        echo "File $FILE_PREFIX$ARG already downloaded"
    else
        curl $CURL_OPTIONS "$BASE_URL$ARG" > "data/$FILE_PREFIX$ARG"
        echo "Downloaded file $FILE_PREFIX$ARG"
    fi
}

download_all_files()
{
    echo "Downloading all files..."
    for (( i=0; i<=$LAST_FILE; i++ ))
    do
        download_file $i
    done
}


for ARG in "$@"
do
    # Clear command
    if [ "$ARG" = "-c" -o "$ARG" = "--clear" ]
    then
        echo "Clearing data of '.vb' and '.dec' files..."
        rm data/*.vb data/*.dec
        break
    elif [ "$ARG" = "-a" -o "$ARG" = "--all" ]
    then
        while true
        do
            read -p "Are you sure you want to download all of the files? This will take some time and space... [Y/N]" yn
            case $yn in
                [Yy]* ) download_all_files; break;;
                [Nn]* ) break;;
            esac
        done

    # Otherwise we only accept numbers
    elif ! [[ $ARG =~ ^[0-9]+$ ]]
    then
        echo "Argument '$ARG' not a valid number!"
        continue
    else
        #If not stopped yet, we will download the file
        download_file $ARG
    fi

done