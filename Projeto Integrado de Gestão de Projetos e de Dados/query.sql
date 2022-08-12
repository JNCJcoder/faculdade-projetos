create table Aluno (
    Nr_Rgm          number(8),
    Nm_Nome         varchar2(40),
    Nm_Pai          varchar2(40),
    Nm_Mae          varchar2(40),
    Dt_Nascimento   date,
    Id_Sexo         char(1),
    constraint aluno_nr_rgm_pk primary key (Nr_Rgm)
);

create table Classe (
    Cd_Classe       number(8),
    Nr_AnoLetivo    number(4),
    Nr_Serie        number(2),
    Sg_Turma        varchar2(2),
    Cd_Escola       number(6),
    Cd_Grau         number(2),
    Cd_Periodo      number(2),
    constraint classe_cd_classe_pk primary key (Cd_Classe)
);

create table Matricula (
    Nr_Rgm          number(8),
    Cd_Classe       number(8),
    Dt_Matricula    date,
    constraint matricula_nr_rmg_fk foreign key (Nr_Rgm) references Aluno(Nr_Rgm),
    constraint matricula_cd_classe_fk foreign key (Cd_Classe) references Classe(Cd_Classe)
);