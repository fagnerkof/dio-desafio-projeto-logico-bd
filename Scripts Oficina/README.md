# Exercício 2 de Projeto Lógico de Banco de Dados - DIO

Este projeto é o Exercício do desafio de projeto do Bootcamp DIO - "Potência Tech powered by iFood | Ciência de Dados com Python" 
Desafio 2 - Construa um Projeto Lógico de Banco de Dados do Zero
Os arquivos inclusos são: o script da modelagem em MySQL Workbench, um print demonstrativo e o Script em SQL.

Mapeamento para o cenário:
- Criação de um sistema para controlar e gerenciar ordens de serviço em uma oficina mecânica.
- Os clientes trazem seus veículos para reparos ou manutenção na oficina.
- Cada veículo é atribuído a uma equipe de mecânicos que identifica os serviços necessários e cria uma ordem de serviço (OS) com a data de conclusão.
- Com base na OS, calcula-se o custo de cada serviço usando uma tabela de referência para custos de mão de obra.
- O custo das peças também é adicionado à OS, e o cliente autoriza a realização dos serviços.
- Os mecânicos têm atributos como código de cadastro (Id), nome, endereço e departamento.
- Cada OS inclui um número id, data de emissão, valor, status e data prazo de conclusão planejada.