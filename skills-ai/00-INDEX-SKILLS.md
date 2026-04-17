---
tipo: indice
version: "3.0"
fecha-actualizacion: 2025-04-17
ecosistema: CONFINE
tags:
  - skills-ai
  - confine
  - indice
---

# Skills CONFINE v3.0 — Índice

> Actualizado: 17 abril 2025 | 14 skills activos

## Arquitectura

```
modo-operativo-mx          ← Capa cognitiva (CÓMO pensar)
    ↓
gestor-de-asuntos-mx       ← Capa procesal (QUÉ hacer y con quién)
    ↓
[fotos-a-pdf-documental]   ← Preprocesamiento si hay imágenes
    ↓
Skills especializados
    ↓
red-team-adversarial-mx    ← Stress-test adversarial (asuntos ALTO)
    ↓
editor-de-alta-gama        ← Filtro final
    ↓
control-calidad-mx + visual-insights
```

## Skills por Capa

### Orquestación
| Skill | Función |
|---|---|
| [[modo-operativo-mx]] | Modos cognitivos: /ghost, /human, OODA, L99, x30 think... |
| [[gestor-de-asuntos-mx]] | Intake, plazos, routing. Tipos: DF, PC, PF, AD, MER, MX |

### Especializados
| Skill | Rama |
|---|---|
| [[lexguard-fiscal-mx]] | Defensa fiscal SAT/TFJA — reescritura total v3 |
| [[pericial-contable-mx]] | Dictámenes periciales — todas las ramas incl. ORPI/FGR |
| [[asesor-legal-mx]] | Derecho mexicano general — mercantil, penal, civil |
| [[auditoria-financiera-avanzada]] | EEFF, forense, COSO, PLD, valuación |
| [[cuestionario-pericial-mx]] | ⭐ NUEVO — Puntos de pericial, objeciones, audiencias |
| [[cronologia-procesal-mx]] | ⭐ NUEVO — Plazos exactos, vacaciones judiciales, alertas |
| [[red-team-adversarial-mx]] | ⭐ NUEVO — Stress-test adversarial antes de enviar |

### Producción y Calidad
| Skill | Función |
|---|---|
| [[editor-de-alta-gama]] | Edición final — Fase 1 condicional v3 |
| [[control-calidad-mx]] | Verificación normativa — sin cambios |
| [[visual-insights]] | Gráficas y tablas — sin cambios |
| [[fotos-a-pdf-documental]] | Imágenes → PDF documental — sin cambios |
| [[prompt-engineer-mx]] | Ingeniería de prompts — sin cambios |

## Changelog v3.0 (17 abril 2025)

- **lexguard-fiscal-mx**: Reescritura total. Triaje de plazos, vicios formales, 69-B/EFOS, CSD/RFG, árbol de decisión de rutas, plantilla de argumentos, memorándum estratégico.
- **gestor-de-asuntos-mx**: + tipo MER (Juicio Oral Mercantil), + paso de preprocesamiento de fotos, + jerarquía explícita con modo-operativo-mx, + red-team en flujo de asuntos ALTO.
- **modo-operativo-mx**: Handoff limpio al gestor; mapeo modos cognitivos ↔ códigos de asunto.
- **pericial-contable-mx**: + rama penal FGR/ORPI con metodología follow-the-money; + tercero en discordia con protocolo completo.
- **asesor-legal-mx**: Disclaimer de "consulte a un abogado" eliminado; + coordinación nuevos skills.
- **editor-de-alta-gama**: Fase 1 ahora condicional — skip automático con contexto claro.
- **cuestionario-pericial-mx**: Skill nuevo. Redactar/analizar/objetar cuestionarios.
- **cronologia-procesal-mx**: Skill nuevo. Plazos hábiles exactos + cronograma con alertas.
- **red-team-adversarial-mx**: Skill nuevo. Stress-test con 5 perfiles adversariales.
