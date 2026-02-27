# ===== ê›íË =====
$repoPath = "C:\Users\MT4ver2-m81-NiEVtwpA\top\top"
$sourceFile1 = "$env:APPDATA\MetaQuotes\Terminal\Common\Files\result_ea1.json"
$destFile1 = "$repoPath\result_ea1.json"
$sourceFile2 = "$env:APPDATA\MetaQuotes\Terminal\Common\Files\result_ea2.json"
$destFile2 = "$repoPath\result_ea2.json"

Set-Location $repoPath

while ($true) {

    if (Test-Path $sourceFile1) {

        # UTF8(BOMÇ»Çµ)Ç≈çƒï€ë∂
        $content = Get-Content $sourceFile1 -Raw
        [System.IO.File]::WriteAllText($destFile1, $content, (New-Object System.Text.UTF8Encoding($false)))

        # UTF8(BOMÇ»Çµ)Ç≈çƒï€ë∂
        $content = Get-Content $sourceFile2 -Raw
        [System.IO.File]::WriteAllText($destFile2, $content, (New-Object System.Text.UTF8Encoding($false)))

        git add result_ea1.json
        git add result_ea2.json

        $status = git status --porcelain

        if ($status) {
            git commit -m "Auto update result_ea1.json, result_ea2.json"
            git push
            Write-Host "Pushed at $(Get-Date)"
        }
    }

    Start-Sleep -Seconds 60
}
