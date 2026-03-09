# see https://github.com/basecamp/omarchy/blob/master/default/bash/init
(&mise activate pwsh) | Out-String | Invoke-Expression

(&starship init powershell) | Out-String | Invoke-Expression

(&zoxide init powershell) | Out-String | Invoke-Expression