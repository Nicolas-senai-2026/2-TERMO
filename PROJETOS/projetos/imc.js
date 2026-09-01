// Importando a biblioteca (a"ajudinha"que instalamos)
const entrada = require('readline-sync')

console.log("---SISTEMA DE CALCULO DE IMC---")

// 1. Entrada de dados pelo terminal
// O computador para e espera o usuario digitar
const numeroPeso = entrada.question("Digite seu peso: ")
const numeroAltura = entrada.questionFloat("Digite sua altura: ")

// 2. Processamento (a conta)
const calculo = numeroPeso / (numeroAltura ** 2)

// 3. Saída de dados personalizada
console.log("\n---Resultado do IMC---")
console.log(`Seu IMC é: ${calculo.toFixed(2)}`)



