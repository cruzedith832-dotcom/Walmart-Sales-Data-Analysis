# Walmart-Sales-Data-Analysis
Análisis de ventas de Walmart, utilizando POSTGRESQL para identificar tendencias y crecimiento semanal.

Este repositorio contiene un análisis de datos realizado sobre el dataset de ventas de Walmart. El objetivo principal fue transformar datos crudos en información estratégica para la toma de decisiones, aplicando técnicas avanzadas de SQL.

## Tecnologías Utilizadas
- **Lenguaje:** SQL (PostgreSQL)
- **Herramienta de Gestión:** pgAdmin 4
- **Conceptos Aplicados:** DDL/DML, Agregaciones, Sentencias Condicionales (`CASE`) y Funciones de Ventana (`LAG`).

## Hallazgos y Resultados del Análisis

A través de la ejecución de los scripts incluidos, se determinaron los siguientes puntos clave:

1. **Rendimiento en Periodos Especiales:** Se generó un reporte detallado de las semanas festivas para entender los picos de demanda.
2. **Identificación de Sucursales Líderes:** La **Tienda 20** se identificó como la sucursal con mayor volumen de ventas histórico, superando los 300 millones de USD.
3. **Análisis de Promedios en Periodos Normales:** Incluso en semanas no festivas, la **Tienda 20** mantiene el liderazgo con un promedio de 2.09M USD.
4. **Segmentación de Alto Rendimiento:** Determinamos que solo **4 tiendas** del dataset logran superar la meta de ventas promedio de 2 millones de USD semanales.
5. **Estacionalidad y Clima:** Se descubrió una correlación directa entre la temperatura y las ventas; el volumen de transacciones aumenta significativamente en **clima FRÍO** y disminuye en climas cálidos.
6. **Comparativa Secuencial:** Utilicé funciones de ventana para comparar el rendimiento de cada tienda respecto a su semana inmediata anterior.
7. **Cálculo de Variación (Saldo):** Se desarrolló una métrica de "Saldo" para cuantificar la ganancia o pérdida semanal, permitiendo detectar tendencias de crecimiento o alertas de caída de ventas.

## Cómo utilizar este repositorio
El archivo `analisis_walmart.sql` contiene todos los pasos del proyecto:
1. Creación de la tabla.
2. Limpieza y tipado de datos (conversión de fechas).
3. Consultas de análisis de negocio.
