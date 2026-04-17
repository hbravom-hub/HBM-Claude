---
name: red-team-adversarial-mx
description: >
  Análisis adversarial sistemático para práctica forense contable y legal en México.
  Modela al adversario (SAT, MP, TFJA, perito contrario, juez, contraparte) para
  identificar vulnerabilidades antes de que el entregable salga. Activa SIEMPRE en
  asuntos de complejidad ALTA antes de entregar dictámenes periciales, recursos de
  revocación, juicios de nulidad, escritos de defensa, cuestionarios periciales o
  cualquier entregable que será evaluado por un adversario. También activar cuando
  el usuario diga: "revisa cómo me van a atacar", "¿qué puede hacer el SAT?",
  "¿qué diría el perito contrario?", "stress-test", "red team", "¿dónde está
  el punto débil?", "¿cómo me combaten esto?", "adversarial", "vulnerabilidades".
---

# Red Team Adversarial MX — Stress-Test de Argumentos CONFINE

*Ver el tablero desde el lado del adversario no es pesimismo.
Es la diferencia entre ganar y perder.*

---

## Filosofía

Ningún argumento jurídico o pericial es invulnerable. La diferencia entre un
dictamen sólido y uno que se derrumba en audiencia no está en la conclusión —
está en si sobrevivió el escrutinio adversarial antes de salir. Este skill modela
sistemáticamente la mente del adversario para encontrar las grietas antes de que
él las encuentre.

---

## Actores Adversariales — Perfiles de Ataque

### A1 — SAT (Auditor / Revisor)

**Objetivo**: Sostener el crédito fiscal. Encontrar insuficiencia de pruebas, vicios
en la documentación del contribuyente, inconsistencias entre declaraciones.

**Líneas de ataque típicas:**
- Documentos sin materialidad probada (solo papel, sin evidencia de entrega)
- CFDI de proveedores en lista 69-B o sin actividad económica real
- Discrepancias entre ingresos declarados y depósitos bancarios
- Deducciones rechazadas por falta de requisitos formales (Art. 29-A CFF)
- Inconsistencias en balanza de comprobación vs. declaraciones
- "Usted no desvirtuó suficientemente las observaciones del acta"

**Punto débil favorito:** Si los papeles están bien pero la materialidad es débil,
  el SAT va por ahí. Si la materialidad está probada, va por los formalismos.

---

### A2 — TFJA (Magistrado / Sala)

**Objetivo**: Resolver con apego a derecho. No tiene preferencia por ninguna parte
*en teoría*, pero es sensible a: argumentos bien fundamentados, cronología clara,
congruencia interna del expediente.

**Líneas de cuestionamiento típicas:**
- "¿Por qué no presentó la documentación durante el procedimiento?"
- "¿El agravio es de forma o de fondo? No puede alegar ambos con la misma intensidad."
- "¿La NIF que cita efectivamente dice eso en ese párrafo?"
- "¿Su dictamen responde todos los puntos de la pericial?"
- "El perito contrario dice X, ¿cómo lo refuta técnicamente?"

**Punto débil favorito:** Inconsistencias entre lo que se alegó en el recurso y lo
  que se argumenta en nulidad. Si el expediente administrativo tiene silencios
  estratégicos del contribuyente, el TFJA los nota.

---

### A3 — Ministerio Público (FGR)

**Objetivo**: Acreditar el tipo penal y demostrar que existe daño patrimonial o
enriquecimiento ilícito. El MP asume culpabilidad y busca evidencia para sostenerla.

**Líneas de ataque típicas:**
- "Los depósitos no tienen origen documentado — son recursos de procedencia ilícita."
- "Las transferencias entre empresas relacionadas son triangulación."
- "El valor de los activos declarados no corresponde al nivel de vida."
- "La empresa tenía facturación pero sin capacidad operativa real."
- "El perito de la defensa no consideró [dato inconveniente]."

**Punto débil favorito:** Cualquier brecha entre ingresos documentados y nivel de
  vida / patrimonio es el punto de entrada del MP. La carga de demostrar origen
  lícito en la práctica recae en el imputado aunque legalmente no debería.

---

### A4 — Perito Contrario (en TFJA, JOM, CNPP)

**Objetivo**: Desacreditar el dictamen de Humberto y sostener las conclusiones propias.

**Estrategias típicas del perito contrario:**
- Cuestionar la metodología: "No aplicó el procedimiento correcto según NIA X"
- Cuestionar la evidencia: "Analizó documentos que no obran en el expediente"
- Cuestionar la normatividad citada: "El artículo que cita no aplica a este caso"
- Señalar omisiones: "No consideró [factor] que modifica la conclusión"
- Ofrecer metodología alternativa con resultado diferente

**Punto débil favorito:** Si las conclusiones son correctas pero la metodología
  tiene huecos documentales, el perito contrario va por los huecos, no por las
  conclusiones.

---

### A5 — Juez (Oral Mercantil / Penal)

**Objetivo**: Resolver con equidad y apego al expediente. En juicios orales, el
juez evalúa credibilidad, claridad y consistencia del perito en tiempo real.

**Preguntas difíciles en audiencia:**
- "¿Puede explicarme en términos simples por qué llegó a esa conclusión?"
- "¿Su metodología es la única aceptada o existen metodologías alternativas?"
- "¿Si el dato X fuera diferente, cambiaría su conclusión?"
- "¿Revisó usted mismo los documentos o delegó en su equipo?"
- "¿El plazo para rendir el dictamen fue suficiente?"

**Punto débil favorito:** El juez no es contador. Si el perito no puede explicar
  su conclusión en lenguaje accesible, pierde credibilidad aunque tenga razón.

---

## Protocolo de Análisis Adversarial

### Paso 1 — Identificar el Entregable a Stress-Testear

```
Tipo de entregable: [dictamen / recurso / escrito de nulidad / cuestionario / otro]
Actor adversarial principal: [SAT / TFJA / MP / perito contrario / juez]
Actores secundarios (si aplica): [lista]
Posición que defiende el entregable: [resumen en 1 frase]
```

### Paso 2 — Simulación de Ataque por Actor

Para cada actor relevante, ejecutar:

```
SIMULACIÓN: [Actor Adversarial]
──────────────────────────────────────────────────────────
ROL: Me coloco en la posición de [actor]. Mi objetivo es [objetivo del actor].
Tengo acceso a: [expediente / dictamen / declaraciones / base de datos SAT]

ANÁLISIS DEL ENTREGABLE DESDE MI POSICIÓN:

1. ¿QUÉ ES LO MÁS ATACABLE?
   [Identificar el argumento más débil, la evidencia más delgada,
    la normatividad más debatible]

2. ¿CÓMO LO ATACO?
   [Línea de argumentación específica, con la norma o criterio que usaría]

3. ¿QUÉ PROBABILIDAD LE DOY A MI ATAQUE?
   Alta / Media / Baja — ¿Por qué?

4. ¿HAY ALGO QUE ME PREOCUPA DEL ENTREGABLE?
   [Lo que desde mi posición adversarial me parecería difícil de combatir]

5. ¿QUÉ PEDIRÍA AL JUZGADOR / TRIBUNAL?
   [La consecuencia concreta que buscaría: nulidad / desestimación / archivo]
──────────────────────────────────────────────────────────
```

### Paso 3 — Mapa de Vulnerabilidades

```
MAPA DE VULNERABILIDADES — [Nombre del asunto]
══════════════════════════════════════════════════════
┌──────────────────────────────────────────────────────┐
│ VULNERABILIDADES CRÍTICAS (corregir antes de enviar) │
├──────────────────────────────────────────────────────┤
│ 1. [Vulnerabilidad] → [Cómo la atacaría el adversario] │
│    Corrección sugerida: [cómo blindarla]              │
│ 2. ...                                                │
├──────────────────────────────────────────────────────┤
│ VULNERABILIDADES IMPORTANTES (manejar con cuidado)   │
├──────────────────────────────────────────────────────┤
│ 1. [Vulnerabilidad] → [Línea de ataque posible]       │
│    Manejo sugerido: [cómo anticiparla en el texto]   │
├──────────────────────────────────────────────────────┤
│ FORTALEZAS (difíciles de atacar — destacar)          │
├──────────────────────────────────────────────────────┤
│ 1. [Fortaleza] → [Por qué es sólida]                  │
│ 2. ...                                                │
├──────────────────────────────────────────────────────┤
│ RECOMENDACIÓN GENERAL                                 │
│ [Aprobado / Aprobado con ajustes / Requiere revisión] │
└──────────────────────────────────────────────────────┘
```

### Paso 4 — Recomendaciones de Blindaje

Para cada vulnerabilidad crítica o importante, proponer:

```
BLINDAJE PARA [vulnerabilidad]
─────────────────────────────────
Texto actual:  "[lo que dice el entregable]"
Punto débil:   "[cómo lo atacaría el adversario]"
Texto mejorado: "[propuesta de redacción que cierra la brecha]"
Evidencia adicional recomendada: "[documento / prueba que blindaría esta sección]"
```

---

## Casos de Uso Concretos

### Dictamen pericial de trazabilidad (ORPI/FGR)
Actor principal: MP (A3) + Perito de cargo (A4)
Foco del stress-test:
- ¿Hay depósitos que no pude asignar a fuente lícita? (brecha que el MP explotará)
- ¿Mi metodología de trazabilidad está documentada paso a paso?
- ¿El perito de cargo puede ofrecer una cuantificación diferente y por qué la mía es más sólida?

### Recurso de revocación / Juicio de nulidad
Actor principal: SAT resolviendo (A1) + TFJA (A2)
Foco del stress-test:
- ¿Cada argumento está correctamente fundado en ley y motivado en hechos?
- ¿El expediente administrativo tiene silencios que perjudican?
- ¿Los argumentos de forma no debilitan los de fondo si los primeros no prosperan?

### Dictamen pericial mercantil (JOM)
Actor principal: Perito contrario (A4) + Juez (A5)
Foco del stress-test:
- ¿Mis conclusiones son explicables en términos simples?
- ¿El perito contrario puede señalar que usé una NIF que no aplica?
- ¿Los números cuadran internamente (sumas, fechas, montos)?

---

## Integración en el Ecosistema

Este skill opera ANTES de `editor-de-alta-gama`, como penúltimo paso:

```
[skills de producción]
    ↓
[red-team-adversarial-mx]  ← Stress-test adversarial — identificar vulnerabilidades
    ↓
[editor-de-alta-gama]      ← Edición final con los ajustes del red-team incorporados
    ↓
[control-calidad-mx]       ← Verificación normativa final
```

**Regla:** Si el red-team encontró vulnerabilidades críticas, el entregable vuelve
al skill especializado para corrección antes de ir al editor.

---

## Lo que NO hago

- No predigo el resultado del litigio — analizo vulnerabilidades, no adivino sentencias.
- No sugiero argumentos ilegítimos o contrarios a la ética profesional.
- No evalúo la viabilidad política o comercial del caso — solo la técnica.
- No reemplazo el juicio estratégico de Humberto — lo informo con el peor escenario posible.
