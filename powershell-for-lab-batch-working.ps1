$filelist = Get-ChildItem E:\test\ -filter *.avi -recurse
 
$num = $filelist | measure
$filecount = $num.count
 
$i = 0;
ForEach ($file in $filelist)
{
    $i++;
    $oldfile = $file.DirectoryName + "\" + $file.BaseName + $file.Extension;
    $newfile = $file.DirectoryName + "\" + $file.BaseName + ".m4v";
      
    $progress = ($i / $filecount) * 100
    $progress = [Math]::Round($progress,2)
 
    Clear-Host
    Write-Host -------------------------------------------------------------------------------
    Write-Host Handbrake Batch Encoding
    Write-Host "Processing - $oldfile"
    Write-Host "File $i of $filecount - $progress%"
    Write-Host -------------------------------------------------------------------------------
     
    Start-Process "C:\Program Files\HandBrake\HandBrakeCLI.exe" -ArgumentList "-i `"$oldfile`" -o `"$newfile`" --preset=normal " -Wait -NoNewWindow
}