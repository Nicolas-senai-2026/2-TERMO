// aula1

// console.log("Olá, mundo!");
// console.log("Estou começando a aprender JavaScript.");
// console.log("Esta é a disciplina de BackEnd 1.");

// aula 2

// const nome = "Carlos";
// let idade = 16;
// const curso = "Desenvolvimento de Sistemas";
// const matriculado = true;
// console.log(nome);
// console.log(idade);
// console.log(curso);
// console.log(matriculado);
// console.log("Nome:", nome);
// console.log("Idade:", idade);
// console.log("Curso:", curso);
// console.log("Está matriculado?", matriculado);

// aula3

// const numero1 = 20;
// const numero2 = 5;
// const soma = numero1 + numero2;
// const subtracao = numero1 - numero2;
// const multiplicacao = numero1 * numero2;
// const divisao = numero1 / numero2;
// const resto = numero1 % numero2;
// console.log("Soma:", soma);
// console.log("Subtração:", subtracao);
// console.log("Multiplicação:", multiplicacao);
// console.log("Divisão:", divisao);
// console.log("Resto da divisão:", resto);

// Desafio 1 - Calcular uma média
// const nota1 = 7;
// const nota2 = 8;
// const nota3 = 9;
// const media = (nota1 + nota2 + nota3) / 3;
// console.log("Média:", media);

// Desafio 2 - Calcular uma compra
// const produto = "Caderno";
// const preco = 15;
// const quantidade = 3;
// const total = preco * quantidade;
// console.log("Produto:", produto);
// console.log("Valor total:", total);

// aula4

// const readline = require("readline-sync");
// const nome = readline.question("Digite seu nome: ");
// const cidade = readline.question("Digite sua cidade: ");
// console.log("Olá,", nome);
// console.log("Você mora em", cidade);

// const idade = Number(readline.question("Digite sua idade: "));
// const idadeFutura = idade + 5;
// console.log("Daqui a cinco anos você terá", idadeFutura, "anos.");

// atividade final

const readline = require("readline-sync");

const nome = readline.question("Digite o nome do aluno: ");
const cidade = readline.question("Digite a cidade: ");
const idade = Number(readline.question("Digite a idade: "));
const disciplina = readline.question("Digite a disciplina: ");

const nota1 = Number(readline.question("Digite a primeira nota: "));
const nota2 = Number(readline.question("Digite a segunda nota: "));
const faltas = Number(readline.question("Digite a quantidade de faltas: "));

const media = (nota1 + nota2) / 2;

console.log("\n--- RELATÓRIO DO ALUNO ---");
console.log("Aluno:", nome);
console.log("Idade:", idade, "anos");
console.log("Cidade:", cidade);
console.log("Disciplina:", disciplina);
console.log("Nota 1:", nota1);
console.log("Nota 2:", nota2);
console.log("Média:", media);
console.log("Faltas:", faltas);