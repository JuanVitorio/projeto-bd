SELECT DISTINCT f.nome
FROM funcionario f
JOIN projeto p ON p.cod_responsavel = f.codigo
LEFT JOIN departamento d ON f.cod_depto = d.codigo
LEFT JOIN funcionario gerente ON d.cod_gerente = gerente.codigo
WHERE f.codigo = d.cod_gerente
   OR f.salario > IFNULL(gerente.salario, 0);	