# see https://github.com/basecamp/omarchy/blob/master/default/bash/init
(&mise activate pwsh) | Out-String | Invoke-Expression

if (
	$Host.Name -in @('ConsoleHost', 'Visual Studio Code Host') -and
	$env:TERM -ne 'dumb' -and
	(Get-Command starship -ErrorAction SilentlyContinue)
) {
	(&starship init powershell) | Out-String | Invoke-Expression
}

(&zoxide init powershell) | Out-String | Invoke-Expression