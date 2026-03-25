#!/bin/bash
# 메인 레포에서 insights 콘텐츠만 가져오기
# Vercel 빌드 시 자동 실행

REPO="https://github.com/chat-prompt/openclaw-platform-docs.git"
DEST="src/content/insights"
TEMP=$(mktemp -d)

echo "📥 Fetching insights from main repo..."
git clone --depth 1 --filter=blob:none --sparse "$REPO" "$TEMP" 2>/dev/null
cd "$TEMP"
git sparse-checkout set src/content/insights 2>/dev/null
cd -

# 기존 insights 폴더 비우고 복사
rm -rf "$DEST"/*
cp "$TEMP/src/content/insights/"*.md "$DEST/" 2>/dev/null

# 정리
rm -rf "$TEMP"

echo "✅ $(ls "$DEST/"*.md 2>/dev/null | wc -l | tr -d ' ')개 인사이트 파일 동기화 완료"
