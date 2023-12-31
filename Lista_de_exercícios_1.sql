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

-- 11.
create view livros_e_autores as
select titulo,nome from livros l 
join autores a on a.id = l.autor_id;

-- 12.
create view aluno_curso as
select nome, curso from alunos a
right join matriculas m on m.id  = a.id;
select * from aluno_curso;

-- 13.
select nome, titulo from  autores a
left join  livros l  on a.id = l.autor_id;

-- 14.
select nome, curso
from alunos a
right join matriculas m on m.id  = a.id;

-- 15.
select nome, curso
from alunos a
inner join matriculas m on m.id  = a.id;

-- 16.
select nome as nome_autor, count(livros.id) as quantidade_de_livros from autores
left join livros on autores.id = livros.autor_id
group by autores.id
order by quantidade_de_livros desc
limit 1;

-- 17.
select produto, sum(receita) as soma_da_receita
from vendas 
group by produto
having sum(receita) = (
  select min(total_da_receita)
  from (
		  select produto, sum(receita) as total_da_receita
      from vendas 
      group by produto ) as receita_gerada_por_cada_produto
);

-- 19.
select alunos.id as Aluno_ID,alunos.nome as Nome_Aluno,count(matriculas.id) as Numero_de_Matriculas from alunos
left join  matriculas on alunos.id = matriculas.aluno_id
group by alunos.id, alunos.nome;

-- 20.
select alunos.id as Aluno_ID,alunos.nome as Nome_Aluno,count(matriculas.id) as Numero_de_Matriculas from alunos
left join  matriculas on alunos.id = matriculas.aluno_id
group by alunos.id, alunos.nome;
