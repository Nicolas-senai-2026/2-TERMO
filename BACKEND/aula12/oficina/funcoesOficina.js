function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;

}


function verificarGarantia(Meses) {
    if (Meses <= 3) {
        return "Dentro da Garantia"
    } else {
        return "Garantia Expirada"
    }
}

function calcularPorcentagem(valorTotal) {
    return valorTotal * 0.8;
}

module.exports = {
    calcularOrcamento, verificarGarantia, calcularPorcentagem
}