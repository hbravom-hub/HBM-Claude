[2026-06-29 14:25:54] Commit ae28001: config: automatización completa — hooks + aliases + memory sync

- pre-commit: indexa cambios en tmp
- post-commit: log automático a memoria local
- pre-push: QC normativas (bloquea si hay pendientes)
- Aliases: status-case, exp-idx, bloqueadores, sync-mem
- Script sync-memory.sh: memoria local → GitHub
- WORKFLOW-SETUP.md: documentación completa

Coordinación: GitHub ↔ memoria local ↔ Claude Code
