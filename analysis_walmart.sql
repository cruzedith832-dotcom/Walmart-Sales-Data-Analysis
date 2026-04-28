--1. Creación de la estructura de la tabla.
CREATE TABLE walmart_sales (
    Store INT,
    Date VARCHAR(50),
    Weekly_Sales NUMERIC(15, 2),
    Holiday_Flag INT,
    Temperature NUMERIC(10, 2),
    Fuel_Price NUMERIC(10, 2),
    CPI NUMERIC(15, 8),
    Unemployment NUMERIC(10, 4)
);

--2. Limpieza y formateo de los datos.
ALTER TABLE walmart_sales 
ALTER COLUMN Date TYPE DATE 
USING TO_DATE(Date, 'DD-MM-YYYY');

--3. Análisis de ventas en días festivos.
--Reporte general de lo ocurrido en semanas donde hubo días festivos.
SELECT *
FROM walmart_sales
WHERE holiday_flag = 1
ORDER BY weekly_sales DESC;

--2. Total de ventas por tienda.
--Se realizó un ranking de ventas totales por tienda, identificando a la Tienda 20 como la líder de ingresos con un acumulado superior a los 300 MDD.
SELECT store, SUM(weekly_sales) AS total_vents
FROM walmart_sales
GROUP BY store
ORDER BY total_vents DESC; 

--3.  Total de ventas en semanas sin días festivos.
--En las semanas no festivas, el promedio más alto de ventas es la tienda 20 con 2097048.43.
SELECT store, ROUND(AVG(weekly_sales), 2) AS avg_sales, ROUND(AVG(temperature), 2) AS avg_temperature
FROM walmart_sales
WHERE holiday_flag = 0
GROUP BY store
ORDER BY AVG(weekly_sales) DESC; 

--4. Tiendas con promedio de venta semanal mayor 2,000,000
--Esto nos permitió identificar las sucursales con alto rendimiento.
SELECT store, ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM walmart_sales
GROUP BY store
HAVING AVG(weekly_sales) > 2000000; 


--5. Impacto del clima en el promedio de ventas.
--Analizamos la estacionalidad climática, descubriendo una correlación inversa entre la temperatura y las ventas: a menor temperatura, mayor volumen de compra.
SELECT ROUND(AVG(weekly_sales), 2) avg_sales, 
CASE WHEN temperature < 50 THEN 'FRIO'
WHEN temperature BETWEEN 50 AND 80 THEN 'TEMPLADO'
ELSE 'CALOR'
END AS clima
FROM walmart_sales
GROUP BY 2;  

--6. Análisis de crecimiento semanal.
--Comparamos las ventas semanales para ver el rendimiento por tienda.
SELECT store, date, weekly_sales, LAG(weekly_sales) OVER(PARTITION BY store ORDER BY date) AS vent_anterior
FROM walmart_sales;  

--7.  Monitoreo de crecimiento de ventas por tienda. 
--Calculamos la variación semanal (saldo) para monitorear la salud financiera de cada sucursal y detectar alertas en picos de caída de ventas.
SELECT store, date, weekly_sales, LAG(weekly_sales) OVER(PARTITION BY store ORDER BY date) AS vent_anterior, 
weekly_sales - LAG(weekly_sales) OVER(PARTITION BY store ORDER BY date) AS diferencia
FROM walmart_sales;
*/








