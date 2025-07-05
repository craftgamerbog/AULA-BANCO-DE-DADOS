create database escola;
use escola;
create table professores (
id int auto_increment primary key,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(15));

create table alunos (
id int auto_increment primary key,
nome VARCHAR(100) NOT NULL,
idade INT,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(15));

create table disciplinas (
id INT auto_increment primary key,
nome VARCHAR(100) NOT NULL,
professor_id INT,
FOREIGN KEY (professor_id) REFERENCES professores(id));

create table matriculas (
id int auto_increment primary key,
aluno_id INT, 
disciplina_id INT,
foreign key (aluno_id) References alunos(id),
foreign key (disciplina_id) references disciplinas(id));

insert into professores(nome, email, telefone) values
('Ana Silva', 'ana.silva@escola.com', '123456789'),
('Carlos Pereira', 'carlos.pereira@escola.com', '987654321');

 
 insert into alunos(nome, idade, email, telefone) values
 ('João Souza', 15, 'joão.souza@escola.com', '111222333'),
 ('Maria Oliveiram', 14, 'Maria.oliveira@escola.com', '444555666');
 insert into disciplinas(nome, professor_id) values
 ('Matematica', 1),
 ('Historia', 2);
 insert into matriculas(aluno_id, disciplina_id) values
 (1, 1),
 (1, 2),
 (2, 1);
 
 select * from professores;
 
 select * from alunos;
 
select disciplinas.nome as Disciplina, professores.nome as professores from disciplinas
Join professores on disciplinas.professor_id = Professores.id;

select alunos.nome as Aluno, disciplinas.nome as Diciplina
from matriculas
join alunos on matriculas.aluno_id = alunos.id
join disciplinas on matriculas.disciplina_id = disciplinas.id


 