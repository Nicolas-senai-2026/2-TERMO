const entrada = require('readline-sync');

console.log("----------------------------");
console.log("   CLASSIFICACAO DE TEMPERATURA      ");
console.log("----------------------------\n");

const temperatura = entrada.questionFloat("Temperatura: ");

if (temperatura <=60) {
    console.log("situação NORMAL.");
} else if (temperatura =>61 && temperatura <= 80) {
    console.log("situação ATENÇÃO.");
} else {
    console.log("situação CRÍTICA.")
}