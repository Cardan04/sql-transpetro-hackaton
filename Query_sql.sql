SELECT
REPLACE(CONCAT(A.LATITUDE, A.LONGITUDE), '.', '') AS CHAVE_PRI,
A.NOME,
B.Classe,
B.Tipo,
B.Porte_bruto,
Comprimento_total_m
Boca_m,
Calado_m,
Pontal_m,
CAST(A.DATA AS date) AS DATA,
CONVERT(varchar(8), HORA, 108) AS HORA_EXATA,
CAST(
    DATEADD(hour, ROUND(DATEDIFF(minute, 0, A.HORA) / 60.0, 0), 0) AS time(0)) AS HORA_ARREDONDADA,
CONCAT(LEFT(A.RUMO, 2), '.', RIGHT(A.RUMO, 1)) AS RUMO,
CONCAT(LEFT(A.VELOCIDADE, 2), '.', RIGHT(A.VELOCIDADE, 1)) AS RUMO,
REPLACE(A.LATITUDE, ',', '.') AS LATITUDE,
REPLACE(A.LONGITUDE, ',', '.') AS LONGITUDE,
--A.LATITUDE,
--A.LONGITUDE,
C.Cidade_costeira_proxima,
D.Altura_onda_m,
D.Periodo_seg,
D.Direcao_onda_graus,
D.Vento_m_s,
D.Direcao_vento_graus,
E.Temperatura_C,
E.Umidade,
E.Pressao_hPa,
E.Precipitacao_mm,
E.Condição

FROM [dbo].[Dados_AIS] A
LEFT JOIN [dbo].[dados_do_navio] B On A.NOME = B.Nome_do_navio
LEFT JOIN [dbo].[cidades_proximas] C ON REPLACE(CONCAT(A.LATITUDE, A.LONGITUDE), '.', '') = C.CHAVE_PRI
LEFT JOIN [dbo].[ondas] D ON CAST(A.DATA AS date) = D.DATA AND C.Cidade_costeira_proxima = D.Cidade_costeira_proxima
LEFT JOIN [dbo].[clima] E ON CAST(A.DATA AS date) = E.DATA AND C.Cidade_costeira_proxima = E.Cidade_costeira_proxima
