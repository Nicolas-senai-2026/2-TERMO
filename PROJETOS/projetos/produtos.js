// Importando a biblioteca (a"ajudinha"que instalamos)
const entrada = require('readline-sync')

console.log("---SISTEMA DE VENDAS DA PADARIA---")

// 1. Entrada de dados pelo terminal
// O computador para e espera o usuario digitar
const nomeProduto = entrada.question("Digite o nome do produto: ")
const precoProduto = entrada.questionFloat("Digite o preco do produto: ")
const quantidadeProduto = entrada.questionInt("Digite a quantidade do produto: ")

// 2. Processamento (a conta)
const total = precoProduto * quantidadeProduto

// 3. Saída de dados personalizada
console.log("\n---Recibo de venda---")
console.log(`Produto: ${nomeProduto}`)
console.log(`Preco: R$${precoProduto.toFixed(2)}`)
console.log(`Quantidade: ${quantidadeProduto}`)
console.log('Total a pagar: R$ ' + total.toFixed(2)) // toFixed(2) = 2 casas decimais
