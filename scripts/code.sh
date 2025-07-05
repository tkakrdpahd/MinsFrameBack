tree . -I "build|externals|README.md" --prune
cloc . --exclude-dir=build,externals --not-match-f='(^|/)README\.md$'