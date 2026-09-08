// exercicio 04
const entrada = require('readline-sync');

console.log("---------------------------------");
console.log("Sistema de classificação: natação");
console.log("---------------------------------\n");

const nome = entrada.question("Nome do atleta: ");
const idade = entrada.questionInt("Idade do atleta: ");

console.log(`\nAtleta: ${nome}`);

if (idade < 5) {
    console.log("situação: muito jovem para competir");
}
else if (idade >= 5 && idade <= 10) {
    console.log("categoria: infantil");
}
else if (idade >= 11 && idade <= 17) {
    console.log("categoria: juvenil");
}
else if (idade >= 18 && idade <= 60) {
    console.log("categoria: adulto");
}
else {
    console.log("categoria: sênior");
}
console.log("---------------------------------");