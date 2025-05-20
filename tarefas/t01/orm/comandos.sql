-- Inserir uma atividade em algum projeto (exemplo: projeto com código 1)
INSERT INTO atividade (descricao, codProjeto, dataInicio, dataFim)
VALUES ('Desenvolvimento do frontend', 1, '2025-05-01', '2025-06-15');

-- Atualizar o líder de algum projeto (exemplo: definindo funcionário 2 como responsável pelo projeto 1)
UPDATE projeto
SET codResponsavel = 2
WHERE codigo = 1;

-- Listar todos os projetos e suas atividades
SELECT 
  p.codigo AS codigo_projeto,
  p.nome AS nome_projeto,
  a.codigo AS codigo_atividade,
  a.descricao AS descricao_atividade,
  a.dataInicio,
  a.dataFim
FROM projeto p
LEFT JOIN atividade a ON p.codigo = a.codProjeto
ORDER BY p.codigo, a.codigo;
