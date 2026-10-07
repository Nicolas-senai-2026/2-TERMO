const entrada = require('readline-sync');

console.log("----------------------------");
console.log("   PEDIDO DE MATERIA PRIMA      ");
console.log("----------------------------\n");

// 2. Coleta de dados (Entrada)
const nomeMaterial = entrada.question("Nome do material: ");
const qtdeMaterial = entrada.questionFloat("Quantidade comprada: ");
const precoMaterial = entrada.questionFloat("Preco unitario: ")

const calculo = qtdeMaterial * precoMaterial;

console.log("=== RESULTADO PEDIDO DE MATERIA PRIMA ===");
console.log(`Nome do material: ${nomeMaterial}`);
console.log(`Valor total da compra: ${calculo.toFixed(2)}`);
console.log("----------------------------");