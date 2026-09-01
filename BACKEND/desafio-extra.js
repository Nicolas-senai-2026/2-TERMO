// desafio extra
const entrada = require('readline-sync');

console.log("---------------------------------");
console.log("Controle de Acesso ao Laboratório");
console.log("---------------------------------\n");

const idade = entrada.questionInt("Idade do aluno: ");
const autorizacao = entrada.question("Possui autorizacao?  (S/N): ");
const professor = entrada.question("Esta acompanhado?   (S/N): ");
const suspensao = entrada.question("Aluno esta suspenso?   (S/N): ");

console.log(`\nAluno: ${idade} anos`);

if (idade >= 16 && autorizacao === "s" && professor === "s" && suspensao === "n") {
}
if (idade >= 16 && autorizacao === 's' && professor === 's' && suspensao === 'n') {
    console.log("ACESSO LIBERADO");
}
else if (idade >= 16 && autorizacao === "s" && professor === "n" && suspensao === "n") {
} else if (idade >= 16 && autorizacao === 's' && professor === 'n' && suspensao === 'n') {
    console.log("ACESSO LIBERADO");
}
else if (idade >= 16 && autorizacao === "n" && professor === "n" && suspensao === "n") {
} else if (idade >= 16 && autorizacao === 'n' && professor === 'n' && suspensao === 'n') {
    console.log("ACESSO NEGADO");
}
else if (idade < 15 && autorizacao === "s" && professor === "n" && suspensao === "n") {
} else if (idade < 15 && autorizacao === 'S' && professor === 'n' && suspensao === 'n') {
    console.log("ACESSO NEGADO");
}
else if (idade < 15 && autorizacao === "n" && professor === "s" && suspensao === "n") {
} else if (idade < 15 && autorizacao === 'n' && professor === 's' && suspensao === 'n') {
    console.log("ACESSO LIBERADO");
}
else if (suspensao === 's') {
    console.log("ACESSO NEGADO");
}
else {
    console.log("ACESSO NEGADO");
}