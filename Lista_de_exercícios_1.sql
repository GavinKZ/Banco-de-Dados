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
where curso = "Engenharia de Software";

-- 5.
select produto, sum(receita) as receita_total from vendas
group by produto;

-- 6.
select nome, count(autor_id) as livros_total from livros l
join autores a on a.id = l.autor_id
group by nome;

-- 7.
select curso, count(a.id) as alunos_qtd from alunos a
join matriculas m on m.id = a.id
group by curso;

-- 8.
select produto, avg(receita) as media_produto
from vendas
group by produto;

-- 9.
create view receita_total as 
select produto, sum(receita) as receita_t from vendas
group by produto;
select * from receita_total
where receita_t >= "10000.00";

-- 10.
create view quantidade_de_livros as
select nome, count(autor_id) as livros_autor_total from livros l 
join autores a on a.id = l.autor_id
group by nome;
select *  from quantidade_de_livros
where total_de_livros_autor >= 2;
