const entrada = require('readline-sync');

const renda = entrada.questionFloat("Digite a sua renda mensal (R$): ");
const nomeLimpo = entrada.question("Seu nome esta limpo? (s/n): ");

if (renda >= 2000 && nomeLimpo === "s") {
  console.log("Empréstimo Aprovado");
} else {
  console.log("Empréstimo Negado");
}