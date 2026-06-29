# WORKFLOW COORDINADO — Agricultores Alfa FIS-RDR

## ✅ INSTALADO

### 1. **Hooks Git** (Automatización)
- **pre-commit**: Guarda diff en tmp para indexación
- **post-commit**: Indexa cambios a memoria local (`~/.claude/projects/.../memory/git-log.md`)
- **pre-push**: QC validación de citas normativas + datos pendientes

### 2. **Aliases Git** (Comandos Rápidos)
```bash
git status-case      # Dashboard expediente (índice + bloqueadores + status)
git exp-idx          # Lista archivos críticos (RR, DICTAMEN, ENTREGABLES)
git bloqueadores     # Extrae 🔴 y PENDIENTE del directorio
git status-exp       # Últimos 10 commits en ENTREGABLES/
git sync-mem         # Sincroniza memoria local → GitHub
git push-now         # Push a origin/main con QC pre-push
git graphify         # Referencia a /graphify en Claude Code
```

### 3. **Script de Sincronización** (`sync-memory.sh`)
- Copia archivos de `~/.claude/projects/.../memory/` → `./SYNC-MEMORY/`
- Auto-commit con fecha
- Auto-push a GitHub
- **Uso**: `git sync-mem` o `./sync-memory.sh`

### 4. **Memoria Local Persistida**
- Directorio: `~/.claude/projects/-Users-humbertobravomena-MODELOS-CLAUDE-Agricultores-Alfa/memory/`
- Archivos:
  - `MEMORY.md` (índice)
  - `project_agricultores_alfa.md` (estado del caso)
  - `analisis_pericial_apa.md` (versión vigente dictamen)
  - `git-log.md` (auto-generado por post-commit)

### 5. **GitHub Sync**
- Remote: `https://github.com/hbravom-hub/HBM-Claude.git`
- Branch: `main`
- Auto-push de memoria en `SYNC-MEMORY/` cada sync

---

## 🚀 FLUJO TÍPICO (Diario)

### Inicio de sesión
```bash
cd "/Users/humbertobravomena/MODELOS CLAUDE/Agricultores Alfa"
git status-case        # Ver bloqueadores + expediente
```

### Durante trabajo (Claude Code)
```bash
# Los hooks funcionan automático:
# 1. pre-commit: indexa cambios
# 2. post-commit: log a memoria
# 3. (opcional) /graphify en Claude para indexar a grafo
```

### Al terminar sesión
```bash
git sync-mem           # Sincroniza memoria → GitHub
git push-now           # Push final (con QC automático)
```

---

## 🔍 QC PRE-PUSH (Bloqueadores)
Antes de cualquier push, valida:
- ✅ Sin "conforme NIFs" (requiere Art. exact)
- ✅ Sin `[PENDIENTE VERIFICAR]`
- ✅ Sin `[DATO PENDIENTE]`
- ✅ Sin lenguaje genérico de IA

Si falla → **no pushea**. Fix:
```bash
# Edita el archivo
git add ENTREGABLES/
git commit --amend --no-edit
git push-now
```

---

## 📊 MEMORIA → OBSIDIAN (Manual)
Si tienes Obsidian + bóveda CONFINE:
```bash
# Copiar SYNC-MEMORY/ → bóveda Obsidian
cp -r SYNC-MEMORY/* ~/Obsidian/CONFINE/
```
Luego Obsidian indexa automático.

---

## 🔗 Integración Graphify
Pendiente: `/graphify` se invoca desde Claude Code cuando quieras convertir estado expediente a grafo.

```bash
# En Claude Code:
/graphify
```

---

## 📝 Comandos de Referencia Rápida

| Comando | Qué hace |
|---------|----------|
| `git status-case` | Dashboard completo del caso |
| `git exp-idx` | Archivos críticos (RR, dictamen, etc.) |
| `git bloqueadores` | Lista de 🔴 encontrados |
| `git sync-mem` | Sync memoria → GitHub |
| `git push-now` | Push con QC automático |
| `./sync-memory.sh` | Script directo (alternativa a alias) |

---

## ⚠️ Notas Importantes

1. **Pre-push QC es HARD**: Si falla, no pushea. Intencional.
2. **Memoria se synca manualmente**: `git sync-mem` no es automático (evita noise)
3. **PDFs no versionados**: En `.gitignore` (pesan mucho)
4. **Hooks están en `.git/hooks/`**: Editables manualmente si necesitas cambios

---

**Setup completado**: 2026-06-29 | Humberto Bravo Mena
