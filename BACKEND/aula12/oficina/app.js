const entrada = require('readline-sync');
const oficina = require('./funcoesOficina');

console.log("==== SISTEMA DE GESTÃO DE OFICINA 1.0 ====");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const hora = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const total = oficina.calcularOrcamento(peca, hora);

const desconto = oficina.calcularPorcentagem(total)

const garantia = oficina.verificarGarantia(tempoUso);

console.log("\n---- RELATORIO DE SERVICO ----");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Total com 20% de desconto: R$ ${desconto.toFixed(2)} `)
console.log(`Status Garantia: ${garantia}`);
console.log("-----------------------------------")

