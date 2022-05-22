#!/bin/bash

# init user specified args
while :; do
    case $1 in
    -d)
        directory=$2
        shift
        ;;
    -f)
        file=$2
        shift
        ;;
    *) break ;;
    esac
    shift
done


# print error
error() {
    echo "Error: $*" >> /dev/stderr
}


start_rename() {
    # checkout both -d, -f are zero length
    if [[ -z $directory && -z $file ]]; then
        error "both -d(directory) and -f(file) are unspecified, example './heicrename.sh -d <heic directory> -f <heic file>'"
        exit 0
    fi

    # handle directory
    if [ x"$directory" != "x" ]; then
        if [ -d $directory ]; then
            echo "directory is $directory"
            recursive_dir $directory
        else
            error "$directory is not a valid directory, please check it"
        fi
    fi

    # handle file
    if [ x"$file" != "x" ]; then
        if [[ -e $file && $file =~ .*\.(heic|HEIC) ]]; then
            echo "heic file is $file"
            rename_heic $file
        else
            error "$file is a invalid heic file, please check it"
        fi
    fi
}

recursive_dir() {
    shopt -s nullglob dotglob
    dirPath=$1

    for pathname in "$dirPath"/*; do
        if [ -d $pathname ]; then
            recursive_dir $pathname
        elif [[ $pathname =~ .*\.(heic|HEIC) ]]; then
            # dir_name=`echo $pathname | sed -r "s/(.+)\/.+/\1/"`
            # file_name=`echo $pathname | sed "s/.*\///"`
            rename_heic $pathname
        fi
    done
}

rename_heic() {
    exiftool '-FileName<CreateDate' -d %Y-%m-%d_%H%M%S%%-c.%%e $1
}

start_rename
