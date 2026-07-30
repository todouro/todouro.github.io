TODOURO SITE V4

Changes:
- Animated Discord banner is limited to the intro area and fades into pure OLED black before the Favourite Game section
- Banner now uses a higher-resolution Discord CDN request, with the original 1024 URL as fallback
- Removed blue/purple site accents in favor of monochrome OLED styling
- Replaced the intro description and removed interest badges
- Added a bottom “Cool buttons” section with six local, crisp @2x 88x31-style buttons
- Added “made by meshahid973 with 💖” at bottom-right with a link to meshahid973.github.io
- Existing full-page AniList hover background remains intact

Install:
cd "C:\Users\devbo\OneDrive\Desktop\ma projects 2\todouro.github.io"
Copy-Item ".\index.html" ".\index.html.before-v4.bak" -Force
Expand-Archive -Path "$env:USERPROFILE\Downloads\todouro-site-v4.zip" -DestinationPath . -Force
start .\index.html
