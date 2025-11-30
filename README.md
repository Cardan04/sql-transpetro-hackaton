📖 Visão Geral

Este projeto consiste em um sistema de análise e monitoramento marítimo, capaz de integrar dados AIS (Automatic Identification System) com informações ambientais como clima e condições de ondas, permitindo consulta unificada, análise operacional, previsões futuras e visualização via dashboard web.

O objetivo principal é gerar inteligência marítima consolidada para tomada de decisão, operações navais, otimização logística e segurança de navegação.

🧠 Funcionalidades Principais

✔ Ingestão de dados AIS (posição, velocidade, rumo, data/hora)
✔ Associação de embarcações à cidade costeira mais próxima
✔ Geração climática sintética simulando API pública (Open-Meteo style)
✔ Geração oceânica sintética simulando Marine Weather API
✔ Criação de VIEW SQL integrando todos os dados em uma tabela única
✔ Possibilidade de uso com API real no futuro
✔ Ideal para dashboards, BI, machine learning e alarmes operacionais

📂 Estrutura de Dados Utilizada
Tabela	Conteúdo
Dados_AIS	Identificação e telemetria dos navios
dados_do_navio	Porte, dimensões e tipo
cidades_proximas	Cidade costeira mais próxima via chave LAT+LON
ondas	Altura, período, vento e direção (sintético API-like)
clima	Temperatura, pressão, umidade e precipitação (API pública simulada)

Resultado final unificado através da VIEW:

vw_geral

🏗 Arquitetura da Solução
AIS -> SQL Server  ┐
Clima -> Sintético ├→ VIEW vw_geral → Dashboard Web / BI
Ondas -> Sintético ┘


Sistema pronto para integração real via API Open-Meteo Weather e Marine.

🔧 Tecnologias Utilizadas
Área	Ferramentas
Backend de dados	Python (Pandas, NumPy)
Clima	Open-Meteo API (sem chave)
Ondas	API sintética baseada em Marine Forecast Model
Banco	SQL Server 2019
Dashboard	HTML + CSS + JS (opcional PowerBI/Grafana)
