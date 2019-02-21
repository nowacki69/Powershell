function Get-DirInfo($dir)
{
    Get-ChildItem $dir -Recurse | Measure-Object -Property length -Sum
    return [math]::Round(($results).sum/1GB,2)
}

Get-DirInfo c:\users\333051\Documents\