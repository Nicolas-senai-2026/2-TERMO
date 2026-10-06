const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
    return real - prevista ;
}

function classificarEficiencia(percentual) {
    if (percentual => 0.90 ) {
        return "META ATINGIDA";
    } else if (percentual => 0.70 && percentual <= 0.89) {
        return "ATENCAO";
    }
    else (percentual <= 0.70)
    console.log("ABAIXO DA META")
}

const producaoPrevista = entrada.questionInt("Producao prevista: ");
const producaoReal = entrada.questionInt("Producao real: ");

console.log(" ==== EXIBICAO ==== ");
console.log(`Producao prevista: ${producaoPrevista}`);
console.log(`Producao real: ${producaoReal}`);
console.log(`Percentual: ${calcularEficiencia}`);
console.log(`Classificacao: ${classificarEficiencia}`);

