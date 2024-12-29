#!/bin/bash

# 開発ブランチに切り替え
git checkout develop || exit

# Webアプリをビルド
flutter build web || exit

# main ブランチに切り替え
git checkout main || exit

# main の内容をクリア（.git フォルダと .gitignore を残す）
find . -mindepth 1 -not -name ".git" -not -name ".gitignore" -exec rm -rf {} +

# build/web の成果物をコピー
cp -r ../build/web/* .

# 成果物をコミットしてプッシュ
git add .
git commit -m "Deploy Web App"
git push origin main --force

# 開発ブランチに戻る
git checkout develop || exit
