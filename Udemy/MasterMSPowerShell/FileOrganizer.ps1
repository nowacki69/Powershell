# Script to Organize Files

# Given a source directory with different types of files, your script should copy files to a destination
# directory into a subfolder named the same as the file's extension. For example, if the source directory
# is c:\source and he destination is c:\organized then all the files with a .jpg extension should be copied
# to c:\organized\jpg. All files with a .txt extension should be copied to c:\organized\txt, etc.

# After moving all of the files, your script should generat some statistics on the destination directories.
# For each folder, the script should display the folder name, number of files in that folder and the total
# size of files in that directory.

# Your script should consist of multiple parts:
# 1. parameters that are passed to the script itself (so that it could be executed from the command line.),
# 2. funtion for code that is called repeatedly, and 
# 3. the main processing of the code (i.e., code that is included in the script that is not placed in a function.

# 1. Parameters passed to the script
#    a. The script should take 2 arguments $source and $destination (for the source and destination folders.)

# 2. Functions
#    a. Create a function called CheckFolder that checks for the existence of a specific directory/folder that
#       is passed to it as a parameter. Also, include a switch parameter named create. If the directory/folder
#       does not exist and the create switch is specified, a new folder should be created using the name of
#       the folder/directory that was passed to the function.

#    b. Create a function named DisplayFolderStatistics to display folder statistics for a directory/path that
#       is passed to it. Output should include the name of the folder, number of files in the folder and total
#       size of all files in that folder.

# 3. Main processing
#    a. Test for existence of the source folder (using the CheckFolder function).
#    b. Test for the existence of the destination folder; create it if it is not found (using the CheckFolder
#       function with the -create switch).
#    c. Copy each file to the appropriate destination.
#          i. Display a message when copying a file. The message should list where the file is being moved from
#             and where it is being moved to.
#    d. Display each target folder name with the file count and byte count for each folder.

Param(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$source_dir,
    [Parameter(Position=1, mandatory=$true)]
    [string]$destination_dir,
    [Parameter(Position=2, mandatory=$false)]
    [switch]$create=$false
    )

#Functions
function CheckFolder {
    param (
        $source_dir,
        $destination_dir,
        $create
    )
    if(!(Test-Path -Path $source_dir)){
        Write-Host "$source_dir does not exist; please check..."
        return $false
    }

    if (!(Test-Path -Path $destination_dir)){
        if(!($create)){
            Write-Host "$destination_dir does not exist and create switch not specified; please check..."
            Return $false
        }
        else {
            New-Item -ItemType Directory -Path $destination_dir
            Return $true
        }
    }
    else{
        return $true
    }
}


#Main Processing
if (CheckFolder $source_dir $destination_dir $create){
    $source_files = Get-ChildItem -Path $source_dir
    foreach ($file in $source_files){
        $len = $file.Extension.Length
        if ($len -gt 0) {
            $subfolder = $file.Extension.Substring(1,$len-1)
            $extfolder = $destination_dir + "\" + $subfolder + "\"
            if (!(Test-Path -Path $extfolder)){
                New-Item -ItemType Directory -Path $extfolder
            }
            if (Test-Path -Path $extfolder){
                $source_file = $source_dir + "\" + $file
                Copy-Item $source_file -Destination $extfolder
            }
        }
    }
}
