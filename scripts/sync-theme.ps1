$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try {
    git remote get-url theme *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "未找到 theme 远程仓库。请先添加 https://github.com/yuukoamamiya/hugo-bear-blog-extended.git"
    }

    git subtree push --prefix=themes/hugo-bear-blog-extended theme main
    if ($LASTEXITCODE -ne 0) {
        throw "主题同步失败。请确认博客仓库中的主题修改已经提交，并且 GitHub 认证可用。"
    }
}
finally {
    Pop-Location
}
