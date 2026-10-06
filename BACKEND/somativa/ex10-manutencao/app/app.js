const entrada = require('readline-sync');

// Importando o nosso módulo (caixa de ferramentas)
const manutencao = require('./funcoesManutencao');

console.log("=== SISTEMA DE FUNCOES DE MANUTENCAO ===");

// Entradas de dados
const nomeMaquina = entrada.question("Nome da peca: ");
const valorPeca = entrada.questionFloat("Valor da peca: R$ ");
const horaServico = entrada.questionFloat("Horas de servico: ");
const tempoUso = entrada.questionFloat("Meses desde a ultima manutencao: ");


// 1. Calculamos o orçamento bruto usando a ferramenta
const maoDeObra = manutencao.calcularMaoDeObra(horaServico);

const valorTotal = manutencao.calcularTotal(valorPeca, horaServico);

// 2. Verificamos a garantia usando a ferramenta
const statusGarantia = manutencao.verificarGarantia(tempoUso);


// Relatório Final
console.log("\n--- RELATORIO FINAL ---");
console.log(`Nome da maquina: ${nomeMaquina}`);
console.log(`Mao de obra: ${maoDeObra}`);
console.log(`Valor total: R$ ${valorTotal}`);
console.log(`Status: ${statusGarantia}`);
console.log("----------------------------");