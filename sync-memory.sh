#!/bin/zsh
# Sincroniza memoria local → GitHub

MEMORY_DIR="$HOME/.claude/projects/-Users-humbertobravomena-MODELOS-CLAUDE-Agricultores-Alfa/memory"
PROJECT_DIR="$(pwd)"
MEMORY_SYNC_DIR="$PROJECT_DIR/SYNC-MEMORY"

echo "[sync-memory] Iniciando sincronización..."

# Crear directorio de sync
mkdir -p "$MEMORY_SYNC_DIR"

# Copiar archivos de memoria
if [ -d "$MEMORY_DIR" ]; then
  cp -r "$MEMORY_DIR"/* "$MEMORY_SYNC_DIR/" 2>/dev/null
  echo "✓ Memoria copiada a SYNC-MEMORY/"
else
  echo "⚠️  Directorio de memoria no encontrado: $MEMORY_DIR"
  exit 1
fi

# Git add + commit + push
cd "$PROJECT_DIR"
git add SYNC-MEMORY/
git commit -m "sync: memoria local actualizada ($(date +%Y-%m-%d))" 2>/dev/null || echo "ℹ️  No hay cambios nuevos"
git push origin main

echo "✅ Sincronización completada"
