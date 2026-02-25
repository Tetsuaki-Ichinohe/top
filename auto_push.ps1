while ($true) {

    # JSONÉRÉsÅ[
    Copy-Item "C:\Users\MT4ver2-m81-NiEVtwpA\AppData\Roaming\MetaQuotes\Terminal\Common\Files\result_ea1.json" `
              "C:\Users\MT4ver2-m81-NiEVtwpA\top\top\result_ea1.json" -Force

    Copy-Item "C:\Users\MT4ver2-m81-NiEVtwpA\AppData\Roaming\MetaQuotes\Terminal\Common\Files\result_ea2.json" `
              "C:\Users\MT4ver2-m81-NiEVtwpA\top\top\result_ea2.json" -Force

    cd C:\Users\MT4ver2-m81-NiEVtwpA\top\top

    git pull

    $changed = git status --porcelain

    if ($changed) {
        git add .
        git commit -m "auto update both EA"
        git push
        Write-Host "Updated at $(Get-Date)"
    }

    Start-Sleep -Seconds 60
}
