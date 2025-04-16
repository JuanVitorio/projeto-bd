CREATE VIEW funcionarios_por_departamento AS
SELECT 
    cod_depto,
    COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY cod_depto;


SELECT 
    d.descricao AS nome_departamento,
    f.nome AS nome_gerente,
    COALESCE(t.total_funcionarios, 0) AS numero_funcionarios
FROM departamento d
LEFT JOIN funcionario f ON d.cod_gerente = f.codigo
LEFT JOIN funcionarios_por_departamento t ON d.codigo = t.cod_depto;