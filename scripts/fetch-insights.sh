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

# GitHub에서 가져온 파일만 덮어쓰기 (로컬 전용 파일 보존)
cp "$TEMP/src/content/insights/"*.md "$DEST/" 2>/dev/null

# 정리
rm -rf "$TEMP"

echo "✅ $(ls "$DEST/"*.md 2>/dev/null | wc -l | tr -d ' ')개 인사이트 파일 동기화 완료"
