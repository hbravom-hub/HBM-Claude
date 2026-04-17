---
name: cronologia-procesal-mx
description: >
  Calculadora y gestora de plazos procesales mexicanos. Activa SIEMPRE que se
  necesite calcular plazos con precisión: días hábiles contados desde notificación,
  plazos de recursos (revocación, nulidad, amparo), presentación de dictámenes,
  audiencias, contestaciones, requerimientos, vencimientos fiscales, términos CNPP.
  Considera automáticamente: días inhábiles SAT, vacaciones judiciales TFJA/SCJN,
  inhábiles del Poder Judicial, sábados y domingos. Genera cronograma procesal
  completo con alertas escalonadas. Activar con: "¿cuánto plazo tengo?", "¿cuándo
  vence?", "calcula el plazo", "días hábiles", "fecha límite", "plazo fatal",
  "vencimiento", "cronograma del caso", "próximas fechas".
---

# Cronología Procesal MX — Certeza en Plazos

*El plazo es lo primero. Siempre.*

---

## Principio de Operación

Un plazo mal calculado puede costar la defensa de un cliente, la admisión de un
dictamen o la procedencia de un recurso. Este skill calcula con precisión, comunica
con claridad y alerta con anticipación suficiente.

---

## Catálogo de Plazos por Tipo de Actuación

### Defensa Fiscal

| Acto | Plazo | Base legal | Tipo de días |
|------|-------|-----------|--------------|
| Recurso de revocación | 30 días | Art. 121 CFF | Hábiles SAT |
| Juicio de nulidad TFJA (ordinario) | 30 días | Art. 13 LFPCA | Hábiles TFJA |
| Juicio de nulidad TFJA (sumario) | 30 días | Art. 58-2 LFPCA | Hábiles TFJA |
| Amparo indirecto | 15 días | Art. 17 Ley Amparo | Hábiles PJF |
| Amparo contra ley autoaplicativa | 30 días desde entrada en vigor | Art. 17 Ley Amparo | Hábiles PJF |
| Amparo directo | 15 días desde notificación de sentencia | Art. 17 Ley Amparo | Hábiles PJF |
| Contestación requerimiento SAT | Plazo señalado en el acto (mín. 6 días) | Art. 40, 42 CFF | Hábiles SAT |
| Acuerdo conclusivo PRODECON | Antes de notificación de crédito | Art. 69-C CFF | N/A |
| Desahogo 69-B (EFOS) | 15 días | Art. 69-B CFF | Hábiles SAT |
| Desvirtuar observaciones (visita) | 20 días desde última acta parcial | Art. 46-A CFF | Hábiles SAT |
| Desvirtuar observaciones (gabinete) | 20 días desde oficio observaciones | Art. 48 CFF | Hábiles SAT |
| Solicitud de devolución (plazo SAT) | 40 días para resolver (20 IVA exportaciones) | Art. 22 CFF | Hábiles SAT |

### Juicio de Nulidad TFJA — Plazos Procesales Internos

| Etapa | Plazo | Tipo de días |
|-------|-------|--------------|
| Ampliación de demanda | 20 días desde contestación | Hábiles TFJA |
| Contestación de demanda (SAT) | 45 días | Hábiles TFJA |
| Contestación ampliación | 45 días | Hábiles TFJA |
| Período de pruebas | 45 días | Hábiles TFJA |
| Alegatos | 5 días | Hábiles TFJA |
| Cierre de instrucción → laudo | Resolución en término razonable | — |

### Pericial Contable (en juicio)

| Acto | Plazo | Base legal | Tipo |
|------|-------|-----------|------|
| Presentar dictamen (TFJA) | Fecha señalada en auto | RITFJA | Según auto |
| Presentar cuestionario (JOM) | Plazo del proveído | CPCDMX / código local | Según proveído |
| Objetar cuestionario contrario | Plazo del proveído | CPCDMX / código local | Según proveído |
| Audiencia de desahogo pericial | Fecha fijada por tribunal | — | Calendario judicial |
| Presentar dictamen FGR | Coordinación con defensor | CNPP Art. 385 | Variable |

### Procesal Penal (CNPP)

| Acto | Plazo | Base legal |
|------|-------|-----------|
| Audiencia inicial | 48 hrs desde detención (si hay detenido) | Art. 308 CNPP |
| Formulación de cargos | En audiencia inicial | Art. 309 CNPP |
| Investigación complementaria | 3-6 meses (hasta 1 año en delitos graves) | Art. 324 CNPP |
| Ofrecimiento de pruebas periciales | Etapa intermedia, antes de la audiencia | Art. 335 CNPP |
| Juicio oral | Fecha señalada por tribunal | Art. 348 CNPP |

---

## Algoritmo de Cálculo de Días Hábiles

### Regla base: ¿Qué autoridad cuenta los días?

```
Autoridad / Foro  → Días hábiles que se cuentan
SAT (recursos, requerimientos) → Lun-Vie, excluyendo inhábiles CFF + Reglamento Interior SAT
TFJA (juicio de nulidad)      → Lun-Vie, excluyendo vacaciones TFJA (2 períodos/año)
PJF (amparo)                  → Lun-Vie, excluyendo períodos de receso PJF
Juzgado Local (mercantil)     → Según Ley Orgánica local + Código Procesal local
FGR / causa penal             → Días naturales en algunos casos (ej. 48 hrs)
```

### Días inhábiles generales (todos los foros)

- 1 de enero
- 1 de mayo
- 16 de septiembre
- 20 de noviembre
- 25 de diciembre
- Los decretados como inhábiles en el DOF para el año en cuestión

### Períodos de vacaciones judiciales

**TFJA:**
- Primer período: 1er quincena de enero
- Segundo período: 2da quincena de julio + 1ra de agosto
*(verificar resolución del pleno TFJA para el año en curso)*

**PJF (Poder Judicial Federal):**
- Primer período de receso: 15 de diciembre al 15 de enero
- Segundo período de receso: 15 al 31 de julio
*(verificar acuerdos del Consejo de la Judicatura Federal)*

**Nota importante**: verificar siempre en el acuerdo del pleno del tribunal respectivo para el año en curso, ya que las fechas exactas varían.

---

## Protocolo de Cálculo

```
ENTRADA:
  Fecha de notificación    : [día/mes/año] (sello del actuario = día 1)
  Tipo de actuación        : [recurso / nulidad / amparo / dictamen / etc.]
  Foro / autoridad         : [SAT / TFJA / PJF / juzgado local / FGR]

PROCESO:
  1. Identificar plazo aplicable del catálogo
  2. Identificar tipo de días (hábiles o naturales)
  3. Determinar foro para identificar qué días son hábiles
  4. Contar desde el día SIGUIENTE a la notificación
     (el día de la notificación NO cuenta — Art. 12 CFF, Art. 5 LOPJF)
  5. Excluir: fines de semana + inhábiles del foro + períodos vacacionales
  6. El último día del plazo = día hábil N° [plazo]

SALIDA:
  Fecha límite: [día/mes/año — día de la semana]
  Días hábiles restantes al día de hoy: [N]
  Estado: 🟢 Tiempo suficiente / 🟡 Urgente / 🔴 CRÍTICO (< 5 días)
```

---

## Cronograma Procesal Completo

Cuando se solicite, generar el mapa temporal del asunto:

```
CRONOGRAMA PROCESAL — [Nombre del asunto]
══════════════════════════════════════════════════════════
Generado: [fecha] | Foro: [SAT/TFJA/PJF/otro]
──────────────────────────────────────────────────────────
PASADO
  [fecha] — Notificación del acto de autoridad
  [fecha] — [Otras actuaciones ya realizadas]

HOY: [fecha actual]
  ↓
PRÓXIMAS FECHAS
  [fecha] ─── PLAZO FATAL: [acto] ─── [N días hábiles] ─── 🔴
  [fecha] ─── Audiencia de pruebas   ─── [N días hábiles] ─── 🟡
  [fecha] ─── Presentar dictamen     ─── [N días hábiles] ─── 🟢
  [fecha] ─── [Otro hito]            ─── [N días hábiles] ─── 🟢

ALERTAS ESCALONADAS
  🔴 [fecha -5 días] — Alerta crítica: vence recurso de revocación
  🟡 [fecha -10 días] — Preparar escrito para revisión final
  🟢 [fecha -20 días] — Iniciar análisis del acto
══════════════════════════════════════════════════════════
```

---

## Alertas Escalonadas Estándar

Para cualquier plazo calculado, emitir automáticamente:

| Tiempo restante | Nivel | Acción recomendada |
|---|---|---|
| > 20 días hábiles | 🟢 Verde | Iniciar análisis del caso |
| 10-20 días hábiles | 🟢 Azul | Iniciar redacción del escrito / dictamen |
| 5-10 días hábiles | 🟡 Amarillo | Tener borrador listo, revisión y edición |
| 3-5 días hábiles | 🟠 Naranja | Urgente: entregable debe estar casi listo |
| < 3 días hábiles | 🔴 Rojo | CRÍTICO: presentación inminente |
| Vencido | ⛔ Negro | Comunicar inmediatamente, evaluar reposición |

---

## Notas de Precisión

- **Fecha de notificación**: siempre usar la fecha del sello del actuario en el acuse, no la fecha de elaboración del acto ni la fecha en que el cliente recibió físicamente.
- **Notificación por estrados**: el plazo corre desde el día siguiente a que se fijaron los estrados, no desde que el contribuyente se enteró.
- **Notificación por buzón tributario**: desde el día siguiente al que queda disponible el documento, con independencia de si el contribuyente lo abrió.
- **Día hábil de vencimiento**: si el último día del plazo cae en día inhábil, el plazo se prorroga al siguiente día hábil (Art. 12 último párrafo CFF).
- **Inhábiles sorpresivos**: el Ejecutivo puede decretar días inhábiles adicionales por DOF (ej. puente oficial). Verificar DOF para el período de cómputo.

---

## Coordinación con Otros Skills

- **Decisión sobre la ruta procesal a seguir**: → `lexguard-fiscal-mx`
- **Estrategia del caso en función del plazo**: → `gestor-de-asuntos-mx`
- **Plazo para cuestionario / dictamen pericial**: → `cuestionario-pericial-mx` + `pericial-contable-mx`
