--VISUALIZAÇÃO DAS TABELAS--

--PESQUISA O ORIENTADOR NA TABELA ORIENTADORES PELO ID JUNTO COM ID DO DEPARTAMENTO REFERENTE--
SELECT * FROM orientadores INNER JOIN departamentos ON orientadores.iddep=departamentos.iddep AND orientadores.iddep=1;

--PESQUISA A DISCIPLINA PELO ID REFERENCIANDO O ID DA MESMA NA TABELA DE DEPARTAMENTOS QUE PERTENCE--
SELECT * FROM disciplinas INNER JOIN departamentos ON disciplinas.iddep=departamentos.iddep AND disciplinas.iddep=2;

--PESQUISA O OS PRÉ REQUISITOS REFERENTE A CADE DISCIPLINA PELO ID--
SELECT * FROM pre_requisitos INNER JOIN disciplinas ON pre_requisitos.iddisc_pre=disciplinas.iddisc;

--PESQUISA O ID DO ALUNO NA TABELA GRADUANDO JUNTO COM A TABELA ALUNOS--
SELECT * FROM  graduando INNER JOIN alunos ON graduando.idaluno=alunos.idaluno AND alunos.idaluno=1;

--PESQUISA O ALUNO PELA DISCIPLINA DO ALUNO E O ID REFERENTE--
SELECT * FROM aluno_disciplina INNER JOIN alunos ON aluno_disciplina.idaluno=alunos.idaluno AND alunos.idaluno=4;

--PESQUISA O ALUNO NA TABELA GRADUANDO PELO ID DO ORIENTADOR--
SELECT * FROM pos_graduando INNER JOIN alunos ON pos_graduando.idaluno=alunos.idaluno AND pos_graduando.idorient=1;

--EXIBE TODOS ORIENTADORES
SELECT * FROM orientadores

--EXIBE TODOS ALUNOS
SELECT * FROM alunos
