# getter
Shell script to retrieve test files used for Programming for Performance Assignment 1

The script downloads files given as parameters. Files are placed inside a new directory (named `data` by default) in the current working directory.

### Usage
1. Download or copy+paste the contents of `getter.sh`
2. Make sure the file has execution rights (`chmod u+x <possible_path>getter.sh`)
3. Run like any other executable with the file numbers you want to download as parameters (e.g. `<possible_path>/getter.sh 0 1 2 3` downloads files F0, F1, F2 and F3)

### Parameters
- accepts any number of integers as parameters
- `-c` or `--clear` deletes the current data folder
- `-a` or `--all` fetches all of the files
⋅⋅* Downloading all of the files will take some time and some space, so use at your own risk

### Options
You can change a few things if you edit the script
- `LAST_FILE` is the number of the last file on the server (245 at the time of writing, this could theoretically change)
- `DATA_DIR` is the name of the directory, where downloaded files are placed (`data` by default)
- `CURL_OPTIONS` can be used if you want to set run parameters for the curl commands (for example `-s`to run curl in silent mode)
- `FILE_PREFIX` is the prefix used for naming the downloaded files (`F` by default)
- `BASE_URL` is pretty obvious, but might change at some point. Who knows?

### Other
You might want to set an alias for the command for more comfortable useage (mine is set to `alias gt="<path_to_file/getter.sh"`>) for reusability.