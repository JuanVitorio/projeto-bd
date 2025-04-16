-- tarefa01-inserts.sql

-- Inserções na tabela departamento (sem gerente inicialmente)
INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Recursos Humanos', NULL),
(2, 'Tecnologia da Informação', NULL),
(3, 'Financeiro', NULL),
(4, 'Marketing', NULL),
(5, 'Logística', NULL);

-- Inserções na tabela funcionario (agora que os departamentos existem)
INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(101, 'Ana Silva', 'F', '1990-05-12', 4500.00, 1),
(102, 'Bruno Costa', 'M', '1985-03-08', 5500.00, 2),
(103, 'Carlos Souza', 'M', '1992-09-23', 6000.00, 2),
(104, 'Daniela Lima', 'F', '1988-07-14', 5200.00, 3),
(105, 'Eduardo Pereira', 'M', '1995-12-01', 4700.00, 4);

-- Atualizando cod_gerente dos departamentos agora que funcionários foram inseridos
UPDATE departamento SET cod_gerente = 101 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 102 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 104 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 105 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 103 WHERE codigo = 5;

-- Inserções na tabela projeto
INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(201, 'Sistema de RH', 'Desenvolver sistema interno para RH', 1, 101, '2023-01-10', '2023-06-10'),
(202, 'Website Institucional', 'Criação do novo site', 2, 102, '2023-02-01', '2023-07-01'),
(203, 'Revisão Financeira', 'Auditoria e planejamento', 3, 104, '2023-03-01', '2023-09-01'),
(204, 'Campanha Digital', 'Marketing em redes sociais', 4, 105, '2023-04-15', '2023-08-15'),
(205, 'Sistema de Entregas', 'Aprimorar logística', 5, 103, '2023-05-01', '2023-12-01');

-- Inserções na tabela atividade
INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(301, 'Levantamento de Requisitos', 'Entrevistas com RH', 101, '2023-01-12', '2023-01-20'),
(302, 'Criação de Wireframes', 'Protótipos para o site', 102, '2023-02-05', '2023-02-20'),
(303, 'Análise de Custos', 'Levantamento de despesas', 104, '2023-03-05', '2023-03-25'),
(304, 'Design de Posts', 'Criação de conteúdo gráfico', 105, '2023-04-20', '2023-05-10'),
(305, 'Mapeamento de Rotas', 'Estudo de rotas de entrega', 103, '2023-05-05', '2023-05-30');

-- Inserções na tabela atividade_projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 304),
(205, 305);
