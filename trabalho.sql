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
join disciplinas on matriculas.disciplina_id = disciplinas.id;

create table Turmas (
id INT auto_increment PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
professor_id INT,
foreign key (professor_id) references professores(id)
);

create table AlunosTurma (
aluno_id INT,
turma_id INT,
Primary Key (aluno_id, turma_id),
FOREIGN KEY (aluno_id) references alunos(id),
FOREIGN KEY (turma_id) references Turmas(id)
);

select alunos.nome as Alunos, Turmas.nome as Turma
from AlunosTurma
join alunos on AlunosTurma.aluno_id = alunos.id
join turmas on AlunosTurma.Turma_id = Turmas.id
where Turmas.nome = 'TurmaOne';
insert into Turmas(nome, professor_id) values
('Turma 1', 2),
('Turma 2', 1),
('Turma 3', 2);

insert into AlunosTurma(aluno_id, turma_id) values
(2, 1);

update Turmas set nome = 'TurmaOne' where nome = 'Turma 1';
select * from Turmas;

delete from Turmas where nome = 'Turma 2';