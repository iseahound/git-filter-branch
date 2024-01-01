# The following contains a here=string 
$Script = @'
Get-ChildItem -File -Force -Recurse | where {$_.extension -in '.ahk','.c','.txt'} | 
    ForEach-Object {
        ((Get-Content $_.FullName) -join "`r`n") | Set-Content -NoNewline $_.FullName
    }
'@

$ByteScript  = [System.Text.Encoding]::Unicode.GetBytes($Script)
[System.Convert]::ToBase64String($ByteScript)