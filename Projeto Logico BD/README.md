# Exercício de Projeto Lógico de Banco de Dados - DIO

Este projeto é o Exercício do desafio de projeto do Bootcamp DIO - "Potência Tech powered by iFood | Ciência de Dados com Python" 
Os arquivos inclusos são: o script da modelagem em MySQL Workbench, um print demonstrativo e o Script em SQL.


Mapeamento para o cenário:

"Refine o modelo apresentado acrescentando os seguintes pontos"

**Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações:**
Usei atributo ENUM na tabela de cliente com opções de PF e PJ, para não precisar criar nenhuma outra tabela para armazenamento dessas informações.   

**Pagamento – Pode ter cadastrado mais de uma forma de pagamento;**
Criado duas tabelas para "CartaodeCredito" e "Boleto" relacionadas à tabela "Pagamento"

**Entrega – Possui status e código de rastreio;**
A tabela "Entrega" tem os atributos para cód de rastreamento ("Tracking"), "Transportadora"  e "Status" (atributo ENUM, com os valores de Aguardando Envio, Enviado e Entegue.)