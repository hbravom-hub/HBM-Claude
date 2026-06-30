# Setup: Backup Automático a Google Drive

## Prerrequisitos

Instala `rclone` (herramienta de sincronización cloud):

```bash
brew install rclone
```

## Configurar acceso a Drive

### Paso 1: Iniciar configuración
```bash
rclone config
```

### Paso 2: Crear nuevo remote
```
n/s/q> n                          # New remote
name> gdrive                       # Nombre del remote
Storage> drive                     # Google Drive
client_id> [dejar vacío]
client_secret> [dejar vacío]
scope> 1                           # Full access (drive)
root_folder_id> [dejar vacío]
service_account_file> [dejar vacío]
Edit advanced config? n
Use web browser to authorize? y   # Se abrirá navegador
```

### Paso 3: Autorizar en navegador
- Se abrirá Google login
- Selecciona tu cuenta (hbravom23@gmail.com)
- Autoriza acceso a Drive
- Vuelve a terminal

### Paso 4: Verificar
```bash
rclone lsd gdrive:/1EfLglcXY9cwYW-DIfLBqdMlu5wnYSfsO
```

Si ves la carpeta → ✅ Funcionando.

## Uso

Una vez configurado, ejecuta:

```bash
./backup-sessions.sh
```

Esto:
1. Commitea sesiones nuevas a GitHub
2. Pushea a origin/main
3. Synca a Drive (CONFINE-PRACTICE-OS/Claude-Sessions)

---

**Automatización:** Para que se ejecute automático después de cada sesión, voy a crear un hook en `.claude/hooks/`.

