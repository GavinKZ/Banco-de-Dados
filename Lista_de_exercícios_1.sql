-- 1.
select titulo from livros;

-- 2.
select nome from autores
where nascimento <= "1900-01-01";

-- 3.
select titulo from livros l
join autores a on a.id = l.autor_id
where a.nome = "J.K. Rowling";

-- 4.
select aluno_id, nome from alunos a
left join matriculas m on m.id = a.id
where curso = "Engenharia de Software"
