#!/bin/sh
# Sestavi samostojno različico (GitHub Pages) iz interval-timer/index.html v timer/index.html
cd "$(dirname "$0")/.." || exit 1
{
cat <<'HEAD'
<!DOCTYPE html>
<html lang="sl">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#0f1420">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Sweat o'Clock">
<link rel="manifest" href="manifest.webmanifest">
<link rel="icon" href="icon-192.png">
<link rel="apple-touch-icon" href="icon-180.png">
<style>
:root { padding-top: env(safe-area-inset-top, 0px); padding-bottom: env(safe-area-inset-bottom, 0px); box-sizing: border-box; }
body { margin: 0; }
[hidden] { display: none !important; }
</style>
</head>
<body>
HEAD
cat interval-timer/index.html
cat <<'TAIL'
<script>if ('serviceWorker' in navigator) navigator.serviceWorker.register('sw.js').catch(() => {});</script>
</body>
</html>
TAIL
} > timer/index.html
