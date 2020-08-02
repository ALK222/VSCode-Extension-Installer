#FUNCTION
function install-stuff($languaje) {
    $file = $languaje + ".txt"
    foreach ($line in Get-Content $PSScriptRoot\$file) {
        code --install-extension $line --force
    }
}

#MAIN
Write-Host "Installing basic extensions"


foreach ($line in Get-Content $PSScriptRoot\Themes.txt) {
    code --install-extension $line --force
}

$c = '0'
while ($c.ToLower() -ne 'y' -and $c.ToLower() -ne 'n' ) {
    $c = Read-Host "Install c/c++ and c# extensions? (Y/N): "
    if ($c.ToLower() -eq 'y') {
        install-stuff("C")
    }
}

$java = '0'
while ($java.ToLower() -ne 'y' -and $java.ToLower() -ne 'n' ) {
    $java = Read-Host "Install java extensions? (Y/N): "
    if ($java.ToLower() -eq 'y') {
        install-stuff("Java")
    }
}

$python = '0'
while ($python.ToLower() -ne 'y' -and $python.ToLower() -ne 'n' ) {
    $python = Read-Host "Install python extensions? (Y/N): "
    if ($python.ToLower() -eq 'y') {
        install-stuff("Python")
    }
}

$ruby = '0'
while ($ruby.ToLower() -ne 'y' -and $ruby.ToLower() -ne 'n' ) {
    $ruby = Read-Host "Install ruby extensions? (Y/N): "
    if ($ruby.ToLower() -eq 'y') {
        gem install solargraph
        install-stuff("Ruby")
    }
}


$web = '0'
while ($web.ToLower() -ne 'y' -and $web.ToLower() -ne 'n' ) {
    $web = Read-Host "Install web app extensions? (Y/N): "
    if ($web.ToLower() -eq 'y') {
        gem install solargraph
        install-stuff("Web")
    }
}
