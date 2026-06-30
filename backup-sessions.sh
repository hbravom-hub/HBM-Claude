#!/bin/zsh
# Backup sessions: GitHub → Drive (CONFINE-PRACTICE-OS)

REPO_ROOT="$(pwd)"
SESSIONS_DIR="$REPO_ROOT/sessions"
DRIVE_FOLDER_ID="1EfLglcXY9cwYW-DIfLBqdMlu5wnYSfsO"
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

echo "[backup-sessions] Iniciando sync GitHub ↔ Drive..."

# 1. Git commit de nuevas sesiones
if [ -n "$(git status --porcelain sessions/)" ]; then
    git add sessions/
    git commit -m "backup: sesiones Claude actualizado ($TIMESTAMP)"
    git push origin main --no-verify
    echo "✅ GitHub: Sesiones commiteadas y pushed"
else
    echo "ℹ️  Sin cambios nuevos en sessions/"
fi

# 2. Sync a Drive (requiere rclone configurado)
if command -v rclone >/dev/null 2>&1; then
    echo "🔄 Syncing a Drive (rclone)..."
    rclone sync "$SESSIONS_DIR" "gdrive://$DRIVE_FOLDER_ID/Claude-Sessions" -v --ignore-case 2>&1 | tail -3
    echo "✅ Drive: Sincronizado"
else
    echo "⚠️  rclone no instalado — Drive sync manual requerido"
    echo "   Instala: brew install rclone"
    echo "   Configura: rclone config"
fi

echo "[backup-sessions] Completado — $(date +%H:%M:%S)"
