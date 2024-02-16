# Tasks for human-rights.nvim

Using [mask](https://github.com/jacobdeichert/mask)

## fixgit

> Delete .git\index.lock (Windows Only)

```bash
echo "Linux is not support!"
```

```powershell
if (Test-Path .\.git\index.lock) {
    Remove-Item .\git\index.lock
}
```

## patch

> Create a patch and copy it to windows

```bash
mask clean
mask diff-patch
mask copy2win-patch
```

```powershell
mask clean
mask diff-patch
mask copy2win-patch
```

## gpg-patch

> Create a GPG-encrypted patch and copy it to Windows

```bash
mask clean
mask diff-patch --gpg
mask copy2win-patch --gpg
```

```powershell
mask clean
mask diff-patch --gpg
mask copy2win-patch --gpg
```

## diff-patch

> Create a patch

**OPTIONS**
* gpg
    * flags: --gpg
    * desc: Use GPG encrypt

```bash
PRODUCT_NAME="human-rights.nvim"
DEFAULT_REMOTE="origin"
DEFAULT_BRANCH="master"
TODAY=$(date +'%Y%m%d')
BRANCH_NAME=$(git branch --show-current)
GPG_PUB_KEY="CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"

if [[ "$BRANCH_NAME" = "$DEFAULT_BRANCH" ]] || [[ "$BRANCH_NAME" = "patch-"* ]]; then
    echo "This branch is $DEFAULT_BRANCH or patch branch"

    for p in "$PRODUCT_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
else
    echo "This branch is uniq feat branch"

    for p in "$PRODUCT_NAME" "_" "$BRANCH_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
fi

if [[ "$gpg" == "true" ]]; then
    GPG_PATCH_NAME+=$PATCH_NAME
    GPG_PATCH_NAME+=".gpg"
    echo "gpg patch file name: $GPG_PATCH_NAME"
    git diff "$DEFAULT_REMOTE/$DEFAULT_BRANCH" | gpg --encrypt --recipient "$GPG_PUB_KEY" >"$GPG_PATCH_NAME"
else
    echo "patch file name: $PATCH_NAME"
    git diff "$DEFAULT_REMOTE/$DEFAULT_BRANCH" >"$PATCH_NAME"
fi
```

```powershell
param(
    $gpg = $env:gpg
)

$product_name = "human-rights.nvim"
$default_remote = "origin"
$default_branch = "master"
$today = Get-Date -UFormat '%Y%m%d'
$branch_name = (git branch --show-current)
$gpg_pub_key = "CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"

if (($branch_name -eq $default_branch) -or ($branch_name -match "^patch-*")) {
    Write-Output "This branch is $default_branch or patch branch"
    $patch_name = "$product_name.$today.patch"
} else {
    $branch_name = $branch_name -replace "/", "-"

    Write-Output "This branch is uniq feat branch"
    $patch_name = "$product_name.$branch_name.$today.patch"
}

$TempMyOutputEncode=[System.Console]::OutputEncoding
[System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

if ($gpg) {
    $gpg_patch_name = "$patch_name.gpg"
    Write-Output "gpg patch file name: $gpg_patch_name"
    #git diff "$default_remote/$default_branch" | 
    #gpg --encrypt --recipient "$gpg_pub_key" >"$gpg_patch_name"
    Write-Output "Windows is not gpg support!"
} else {
    Write-Output "patch file name: $patch_name"
    git diff "$default_remote/$default_branch" | Out-File -Encoding default -FilePath $patch_name
}

[System.Console]::OutputEncoding=$TempMyOutputEncode
```

## patch-branch

> Create a patch branch

```bash
TODAY=$(date +'%Y%m%d')
git switch -c "patch-$TODAY"
```

```powershell
$TODAY = Get-Date -UFormat '%Y%m%d'
git switch -c "patch-$today"
```

## switch-master

> Switch to DEFAULT branch

```bash
DEFAULT_BRANCH="master"
git switch "$DEFAULT_BRANCH"
```

```powershell
$DEFAULT_BRANCH = "master"
git switch $DEFAULT_BRANCH
```

## delete-branch

> Delete patch branch

```bash
mask clean
mask switch-master
git branch --list "patch*" | xargs -n 1 git branch -D
```

```powershell
mask clean
mask switch-master
git branch --list "patch*" | ForEach-Object{ $_ -replace " ", "" } | ForEach-Object { git branch -D $_ }
```

## clean

> Run clean

```bash
rm -f ./*.patch
rm -f ./*.patch.gpg
rm -f ./*.zip
```

```powershell
Remove-Item *.patch
Remove-Item *.patch.gpg
Remove-Item *.zip
```

## copy2win-patch

> Copy patch to Windows

**OPTIONS**
* gpg
    * flags: --gpg
    * desc: Use GPG encrypt

```bash
if [[ "$gpg" == "true" ]]; then
    cp *.patch.gpg $$WIN_HOME/Downloads/
else
    cp *.patch $WIN_HOME/Downloads/
fi
```

```powershell
param(
    $gpg = $env:gpg
)

$TempMyOutputEncode=[System.Console]::OutputEncoding
[System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

if ($gpg) {
    Copy-Item -Path .\*.patch.gpg -Destination $env:USERPROFILE\Downloads
} else {
    Copy-Item -Path .\*.patch -Destination $env:USERPROFILE\Downloads
}

[System.Console]::OutputEncoding=$TempMyOutputEncode
```

## test

```bash
mask lint
```

```powershell
mask lint
```

## lint

> Run lints

```bash
mask selene-lint
mask stylua-lint
mask textlint
mask typo-check
mask shell-lint
```

```powershell
mask selene-lint
mask stylua-lint
mask textlint
mask typo-check
```

## stylua-lint

> Run stylua lint

```bash
stylua --check ./
```

```powershell
stylua --check ./
```

## selene-lint

> Run selene

```bash
selene .
```

```powershell
selene .
```

## textlint

> Run textlint

```bash
pnpm run textlint
```

```powershell
pnpm run textlint
```

## typo-check

> Run typos

```bash
typos .
```

```powershell
typos .
```

## shell-lint

> Run shell lint (Linux only)

```bash
shellcheck --shell=bash --external-sources \
	utils/*

shfmt --language-dialect bash --diff \
	./**/*
```

```powershell
Write-Output "Windows is not support!"
```

## fmt

```bash
mask format
```

```powershell
mask format
```

## format

> Run format

```bash
mask stylua-format
mask shell-format
```

```powershell
mask stylua-format
```

## stylua-format

> Run stylua format

```bash
stylua ./
```

```powershell
stylua ./
```

## shell-format

> Run shfmt (Linux only)

```bash
shfmt --language-dialect bash --write \
	./**/*
```

```powershell
Write-Output "Windows is not support!"
```

## changelog

> Add commit message up to `origin/master` to CHANGELOG.md

```bash
TODAY=$(date "+%Y.%m.%d")
REMOTE_NAME="origin"
BRANCH_NAME="master"
RESULT_FILE="CHANGELOG.md"
GIT_LOG=$(git log "$REMOTE_NAME/$BRANCH_NAME"..HEAD --pretty=format:"%B")

{
    echo "## run"
    echo ""
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/- /g'
    echo ""
    echo '```bash'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/git commit -m "WIP:/g' | sed -e 's/$/" --allow-empty/g'
    echo '```'
    echo ""
    echo "## [v$TODAY]"
    echo ""
    echo "### Added - 新機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Changed - 既存機能の変更について"
    echo ""
    echo "なし"
    echo ""
    echo "### Removed - 今回で削除された機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Fixed - 不具合修正について"
    echo ""
    echo "なし"
    echo ""
} >>$RESULT_FILE

```

```powershell
Write-Output "Windows is not support now!"
```

## pab

> Create a patch branch (alias)

```bash
mask patch-branch
```

```powershell
mask patch-branch
```

## deleb

> Delete patch branch (alias)

```bash
mask delete-branch
```

```powershell
mask delete-branch
```
