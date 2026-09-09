const entrada = require('readline-sync');

console.log("----------------------------");
console.log("   PRODUCAO DO TURNO      ");
console.log("----------------------------\n");

// 2. Coleta de dados (Entrada)
const quantidade = entrada.question("Pecas produzidas por hora: ");
const horas = entrada.questionFloat("Horas do turno: ");

const calculo = quantidade / horas;

console.log("=== RESULTADO PRODUCAO DO TUNRO ===");
console.log(`Producao por hora: ${calculo.toFixed(2)}`);
console.log(`Horas do turno: ${horas}`);
console.log(`Quantidade total produzido: ${quantidade}`);
console.log("----------------------------");