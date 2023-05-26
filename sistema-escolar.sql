//EXERCÍCIO 1
class Aluno {
    constructor(nome, dataNasc){
        this.matricula = Math.floor(Math.random()*2000);
        this.nome = nome;
        this.dataNasc = dataNasc;
        this.notaFinal = 0.0;
        this.situacao = 'Cursando';
    }
    //4
    registrarNota(nota) {
        nota = parseFloat(nota)
        if (nota<0 || nota > 10) {
            console.log('Nota inválida. A nota deve estar entre 0 e 10')
        } else {
            this.notaFinal = nota.toFixed(2)
        }
    }
}
class Curso {
    constructor(codCurso, descricao, categoria) {
        this.codCurso = codCurso;
        this.descricao = descricao;
        this.categoria = categoria;
    }
}
class Turma {
    constructor(codTurma, dataInicio, dataTermino, curso) {
        this.codTurma = codTurma;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.curso = curso;
        this.listaAlunos = [];
    }
     //3
     realizarMatricula(aluno) {
        const anoNasc = new Date(aluno.dataNasc).getFullYear;
        const dataAtual = new Date().getFullYear();
        const diferenca = dataAtual - anoNasc
        if (diferenca < 16) {
            console.log('Aluno não pode se matricular pois não tem idade mínima')
        } else {
            this.listaAlunos.push(aluno)
        }
        
    }
    //5
    fecharDiario() {
        for (let i=0; i < this.listaAlunos.length; i++) {
            const aluno = this.listaAlunos[i];
            if(aluno.notaFinal >= 6.0) {
                aluno.situacao = 'Aprovado'
            } else {
                aluno.situacao = 'Reprovado'
            }}
        }
}


//2
aluno1 = new Aluno('Anna', '01/01/2000')
aluno2 = new Aluno('Bruno', '01/03/2000')
aluno3 = new Aluno('Caio', '02/02/2016')
aluno4 = new Aluno('Dhyson', '21/12/1986')
aluno5 = new Aluno('Lucas', '17/09/1997')
aluno6 = new Aluno('Saul', '25/05/2005')
aluno7 = new Aluno('Paola', '06/03/2004')
aluno8 = new Aluno('Emilly', '09/08/2006')
aluno9 = new Aluno('Leia', '12/04/1995')
aluno10 = new Aluno('Pedro', '08/03/1999')

const curso1 = new Curso('001', 'Matematica', 'Exatas')
const curso2 = new Curso('002', 'Letras', 'Linguagens')
const curso3 = new Curso('003', 'Biologia', 'Biologicas')

turma1 = new Turma("1582.2023.1", "05/05/2023", "05/08/2023", "1582")
turma2 = new Turma("1582.2023.2", "05/05/2023", "05/08/2023", "1582")
turma3 = new Turma("1581.2023.1", "05/05/2023", "05/08/2023", "1581")
turma4 = new Turma("1581.2023.2", "05/05/2023", "05/08/2023", "1581")

//6
turma1.realizarMatricula(aluno1);
turma1.realizarMatricula(aluno2);
turma1.realizarMatricula(aluno3);
turma1.realizarMatricula(aluno4);
turma1.realizarMatricula(aluno5);

turma2.realizarMatricula(aluno6);
turma2.realizarMatricula(aluno7);
turma2.realizarMatricula(aluno8);
turma2.realizarMatricula(aluno9);
turma2.realizarMatricula(aluno10);

aluno1.registrarNota(0.0);
aluno2.registrarNota(5.0);
aluno3.registrarNota(6.0);
aluno4.registrarNota(3.7);
aluno5.registrarNota(10.0);
aluno6.registrarNota(8.9);
aluno7.registrarNota(6.5);
aluno8.registrarNota(2.3);
aluno9.registrarNota(9.4);
aluno10.registrarNota(10.0);

turma1.fecharDiario();
turma2.fecharDiario();

//7
const map = new Map();
map1.set("1582.2023.1" = turma1,"1582.2023.2" = turma2)
console.log("1582.2023.1");
console.log("1582.2023.2");