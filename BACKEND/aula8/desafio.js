// desafio
const entrada = require('readline-sync');

console.log("---------------------------------");
console.log("Controle de Acesso ao Laboratório");
console.log("---------------------------------\n");

const idade = entrada.questionInt("Idade do aluno: ");
const autorizacao = entrada.question("Possui autorizacao?  (S/N): ");
const professor = entrada.question("Esta acompanhado?   (S/N): ");

console.log(`\nAluno: ${idade} anos`);

if (idade >= 16 && autorizacao === "s" && professor === "s") {
    console.log("ACESSO LIBERADO");
}
else if (idade >= 16 && autorizacao === "s" && professor === "n") {
    console.log("ACESSO LIBERADO");
}
else if (idade >= 16 && autorizacao === "n" && professor === "n") {
    console.log("ACESSO NEGADO");
}
else if (idade < 15 && autorizacao === "s" && professor === "n") {
    console.log("ACESSO NEGADO");
}
else if (idade < 15 && autorizacao === "n" && professor === "s") {
    console.log("ACESSO LIBERADO");
}
else {
    console.log("ACESSO NEGADO");
}
console.log("---------------------------------");