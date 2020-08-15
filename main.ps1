#FUNCTION
function install-stuff($languaje) {
    $file = $languaje + ".txt"
    foreach ($line in Get-Content $PSScriptRoot\$file) {
        if ($line.contains("#")) {
            continue
        }
        code --install-extension $line --force
    }
}

#MAIN
$files = Get-ChildItem $PSScriptRoot -Filter *.txt
foreach ($file in $files) {
    $option = '0'
    while ($option.ToLower() -ne 'y' -and $option.ToLower() -ne 'n' ) {
        $option = Read-Host "Install $([System.IO.Path]::GetFileNameWithoutExtension($file)) stuff"
        if ($option.ToLower() -eq 'y') {
            if ([System.IO.Path]::GetFileNameWithoutExtension($file) -eq "Ruby") {
                gem install solargraph
            }
            install-stuff([System.IO.Path]::GetDirectoryName($file))
        }
        
    }
    
}
