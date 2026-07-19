Quais são os tipos de incidentes?
SELECT
DISTINCT incident_type
FROM incidents
---------------------------------------------------------------------

Quantos incidentes existem por categoria?
SELECT
category,
COUNT(*) AS total_inicidentes
FROm incidents
GROUP BY category;
---------------------------------------------------------------------

Quais servidores tiveram mais incidentes?
SELECT
    server AS servidor,
	incident_type AS tipo_incidente,
    COUNT(*) AS total_incidentes
FROM incidents
GROUP BY server, incident_type
ORDER BY total_incidentes DESC;
---------------------------------------------------------------------

Qual é a severidade dos incidentes?
SELECT
severity AS severidade,
COUNT(severity) AS quatidade
FROM incidents
GROUP BY severity
ORDER BY severity ASC;
---------------------------------------------------------------------

Tempo médio de resolução por equipe
SELECT 
    assigned_team AS Equipe,
    ROUND(AVG(resolution_hours), 2) AS Tempo_Médio
FROM incidents
GROUP BY assigned_team;
---------------------------------------------------------------------

Quantos incidentes críticos existem?
SELECT
    COUNT(*) AS total_incidentes_criticos
FROM incidents
WHERE severity = 'Critical';
---------------------------------------------------------------------

Quais regiões tiveram mais incidentes?
SELECT 
region AS regiões,
COUNT(region) AS quantidade_incidente
FROM incidents
GROUP BY region
ORDER BY quantidade_incidente DESC;
---------------------------------------------------------------------

Qual servidor teve maior uso médio de CPU?
SELECT 
server AS servidor,
AVG(cpu_usage) AS média_CPU
FROM incidents
GROUP BY servidor
ORDER BY média_CPU DESC;
---------------------------------------------------------------------

Quais incidentes demoraram mais de 10 horas para resolver?
SELECT
	incident_id,
	server,
	category,
	severity,
	resolution_hours
FROM incidents
WHERE resolution_hours > 10
---------------------------------------------------------------------