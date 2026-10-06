const entrada = require('readline-sync');

console.log("----------------------------");
console.log("    PECA APROVADA OU REPROVADA     ");
console.log("----------------------------\n");

const pesoPeca = entrada.questionFloat("Qual o peso da peca?: ");


if (pesoPeca =>95 && pesoPeca <= 105) {
    console.log("PECA APROVADA");
} else {
    console.log("PECA REPROVADA")
}