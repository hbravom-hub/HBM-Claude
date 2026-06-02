---
name: contradiction-finder-mx
version: "1.0"
last_updated: "2026-06-01"
description: Detección exhaustiva de contradicciones en expedientes, argumentos de autoridad, periciales y documentación fiscal/penal en México. Activar SIEMPRE al revisar: cambios de posición SAT entre años/oficios, inconsistencias en acusaciones FGR, contradicciones entre periciales de partes (tercero en discordia), deficiencias de materialidad (69-B CFF), argumentación contradictoria en escritos. Mata debilidades del contrario antes de redactar escrito. Output: matriz de contradicciones con ubicación exacta, gravedad (🔴 fatal / 🟡 reparable / 🟢 menor), y línea defensiva específica.
---

# Contradiction Finder MX

Orquestador de detección de contradicciones en contexto fiscal, penal y pericial mexicano. Busca grietas en argumentación de autoridad, inconsistencias lógicas, cambios de criterio, y vulnerabilidades documentales que socavan defensa contraria.

## Triggers de activación

Activar **automáticamente** en cualquiera de estos contextos:

- **Fiscal (SAT/TFJA):** "cambio de posición SAT", "oficio contradice artículo", "criterio aplicado diferente", "inconsistencia entre periodos", "criterio PRODECON vs SAT", "tesis jurisprudencial contradice autoridad"
- **Penal (FGR):** "acusación contradictoria", "testigo contradice expediente", "cadena de custodia inconsistente", "acta levantada diferente de fotos", "versión del MP cambió"
- **Pericial (Tercero en discordia):** "dos periciales contradicen", "metodología inconsistente", "conclusión no soporta análisis", "datos de una peritaje no cuadran con otra"
- **Materialidad (69-B CFF):** "autoridad afirma operación inexistente pero después la reconoce", "SAT niega sustancia pero admite movimiento bancario"
- **Análisis general:** "revisa esto para inconsistencias", "busca grietas", "qué le falta al contrario", "cómo se contradicen", "dónde está débil"

No esperes a que pida explícitamente. Cuando revises expedientes, audios de juicio, autos de autoridad, o periciales de contrario — **busca contradicciones automáticamente.**

## Metodología de detección

### Tres niveles de contradicción

**Nivel 1: Lógica textual** (lo que dice vs. lo que significa)
- Una frase afirma A, otra líneas abajo afirma ¬A
- Conclusión contradice fundamentos propios
- Ejemplos: "la operación es inexistente" pero luego "transferencia bancaria de $X"

**Nivel 2: Normativa contradicha** (criterio vs. ley)
- Autoridad aplica artículo diferente al mismo caso año a año
- Tesis jurisprudencial contradice oficio
- Criterio de autoridad vs. SCJN/TFJA publicado

**Nivel 3: Proceso contradictorio** (documentos vs. hechos)
- Acta de levantamiento vs. fotos de escena
- Declaración testigo vs. cadena de custodia
- Análisis de una peritaje vs. metodología otra

### Matriz de análisis

Para cada contradicción encontrada, genera:

```
┌─────────────────────────────────────────────────────────────┐
│ CONTRADICCIÓN                                               │
├─────────────────────────────────────────────────────────────┤
│ ID:          CF-[Numero secuencial]                         │
│ Nivel:       [Lógica / Normativa / Procesal]               │
│ Gravedad:    🔴 Fatal / 🟡 Reparable / 🟢 Menor            │
│ Ubicación 1: [Documento, p. X, párrafo Y, línea Z]         │
│ Ubicación 2: [Documento, p. X, párrafo Y, línea Z]         │
│ Texto 1:     "[Cita exacta <15 palabras]"                  │
│ Texto 2:     "[Cita exacta <15 palabras]"                  │
│ Análisis:    [Explicación de por qué se contradicen]       │
│ Impacto:     [Qué se pierde si no se explota]              │
│ Línea def:   [Cómo usarlo en escrito/alegatos]             │
└─────────────────────────────────────────────────────────────┘
```

**Gravedad:**
- 🔴 **Fatal:** Hunde argumento contrario. Cambio de 180°. Elemento esencial desmentido por su propio texto.
- 🟡 **Reparable:** Debilita posición. Genera duda razonable. Requiere explicación que no da.
- 🟢 **Menor:** Inconsistencia de redacción. Impacto táctico bajo pero sumaría probatoria.

## Modos de operación

### Modo 1: Exploración rápida (Quick Scan)
- Entrada: Documento(s) o expediente
- Búsqueda: Contradicciones obvias, cambios de posición, inconsistencias formales
- Salida: Lista numerada 🔴/🟡/🟢 sin matriz completa
- Tiempo: 2-3 minutos
- **Activar cuando:** Necesitas panorama rápido antes de estrategia profunda

### Modo 2: Análisis estructurado (Deep Dive)
- Entrada: Expediente completo, autos, periciales de ambas partes
- Búsqueda: Lógica textual + normativa + procesal, correlación entre documentos
- Salida: Matriz completa con ubicaciones exactas, análisis y línea defensiva
- Tiempo: Detallado, exhaustivo
- **Activar cuando:** Vas a redactar escrito, alegatos o tercero en discordia

### Modo 3: Comparativa tripartita (para tercero en discordia)
- Entrada: Peritaje parte A, peritaje parte B, tu análisis como tercero
- Búsqueda: Dónde A y B se contradicen; dónde ambas se apartan de norma; inconsistencias internas en cada una
- Salida: Tabla de tres columnas (A | Norma | B) con marcas de contradicción
- Tiempo: Detallado para cada sección
- **Activar cuando:** Eres tercero en discordia y necesitas fundamentar dictamen

## Integración con ecosistema CONFINE

**Upstream:** Activarse automáticamente en:
- `gestor-de-asuntos-mx` al clasificar MAT/PER/PEN (feed de expedientes)
- `m-intake-documental` al procesar documentos nuevos
- `materialidad-fiscal-mx` cuando hay 69-B (detecta contradicciones SAT auto)

**Downstream:** Alimentar a:
- `lexguard-fiscal-mx` — líneas defensivas de contradicción para escritos
- `escritos-procesales-mx` — agravios basados en contradicciones
- `m-tfja-tercero` / `m-tercero-discordia` — vulnerabilidades periciales contrario
- `editor-de-alta-gama` — validación de coherencia pre-entrega

**Coordinación:** No duplica con `control-calidad-mx` (QC valida references propias). **CF busca contradicciones externas (autoridad vs. ley, documento vs. documento, peritaje vs. peritaje).**

## Ejemplos de aplicación

### Ejemplo 1: SAT cambio de posición (Fiscal)

**Entrada:** Oficio de observaciones 2024 vs. criterio aplicado 2023

- **CF-001:** 🔴 Fatal. SAT clasifica ingreso como honorarios en 2023 (ISR 21%), pero en 2024 como ingresos por servicios (ISR 17%). Mismo proveedor, mismos servicios. Contradicción normativa.
- **Línea def:** "La autoridad no ha fundamentado el cambio de criterio. Jurisprudencia exige que clasificaciones equivalentes de operaciones similares mantengan coherencia SCJN 1a/J.10/2018."

### Ejemplo 2: FGR acusación inconsistente (Penal)

**Entrada:** Acusación escrita vs. versión de testigo en amparo vs. acta de inspección

- **CF-002:** 🟡 Reparable. MP afirma que producto estaba en bodega principal, pero acta de inspección ubica en bodega auxiliar. Testigo clave confirm bodega auxiliar. Inconsistencia de ubicación.
- **Línea def:** "Vicio de lógica en acusación. Si ubicación es discutida por acta oficial y testigo, no hay \"certeza\" de hecho punible (CNPP 338)."

### Ejemplo 3: Periciales contradictorias (Tercero en discordia)

**Entrada:** Peritaje contador A (ISR indebido $500K) vs. Peritaje contador B (ISR correcto)

- **CF-003:** 🔴 Fatal. Peritaje A clasifica gasto como deducible (NIF C-1 soportes), Peritaje B lo rechaza por "falta de substancia". Ambos usan mismos documentos. Una metodología es errónea.
- **Tabla tripartita:**
```
A (demandante)     │ Norma (NIF C-1)        │ B (SAT)
Gasto deducible    │ Requisitos: soporte,   │ No deducible
por soporte CFDI   │ relación causal        │ por falta substancia
                   │ (No especifica "sub.") │ (Inventado)
```
- **Línea tercero:** "NIF C-1 no exige 'substancia económica' para deducción. Peritaje B agrega elemento no normativo. Contradicción procesal."

## Output esperado

Siempre estructura en este orden:

1. **Resumen ejecutivo:** "Se detectaron N contradicciones: X 🔴 fatales, Y 🟡 reparables, Z 🟢 menores."
2. **Matriz ordenada por gravedad** (🔴 primero)
3. **Análisis cruzado:** Cómo se conectan (si hay patrón)
4. **Líneas defensivas:** Uso táctico en escrito/alegatos
5. **Blind spots:** Qué NO se contradice (donde hay coherencia)

## Notas operativas

- **No redactes escritos.** Solo identifica contradicciones y propón líneas defensivas. Escritos van a `escritos-procesales-mx`.
- **Precisión normativa:** Si citas jurisprudencia o tesis, verifica con `radar-jurisprudencial-mx` que sea actual.
- **Documentación exacta:** Siempre ubicación: página, párrafo, línea. "Dijo aquí" es insuficiente.
- **Presunción inocencia:** En penal, recuerda que contradicción ≠ culpabilidad. Usa lenguaje defensivo ("genera duda razonable", "no hay certeza").
- **Coordinación pericial:** Si es tercero en discordia, usa `m-tercero-discordia` como marco estructural. CF alimenta análisis de vulnerabilidades.

## Disparadores automáticos

Cuando veas estas palabras/frases en la entrada, **CF ya está activado implícitamente:**

```
"cambio de posición" | "contradice" | "inconsistente" | "no coincide"
"oficio dice X pero acta dice Y" | "peritaje A vs peritaje B"
"SAT aplicó diferente" | "criterio PRODECON vs autoridad"
"cadena de custodia contradictoria" | "testigo contradice acta"
"conclusión no soporta análisis" | "donde está débil el contrario"
```

---

**Versión:** 1.0 (operativo CONFINE v3.7+)  
**Última actualización:** 1 de junio de 2026  
**Coordinación:** gestor-de-asuntos-mx, lexguard-fiscal-mx, escritos-procesales-mx, m-tercero-discordia, control-calidad-mx
