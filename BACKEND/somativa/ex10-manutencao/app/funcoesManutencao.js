// --- ARQUIVO DE FUNÇÕES ---

function calcularMaoDeObra(horas) {
    const valorHora = 80.00;
    return valorHora * horas
}

function calcularTotal(valorPecas, horas) {
    const total = horas * 
    return valorPecas + horas
}



function verificarGarantia(meses) {
    if (meses <= 6) {
        return "EM GARANTIA";
    } else {
        return "FORA DA GARANTIA";
    }
}



// IMPORTANTE: Adicionar a nova função na lista de exportação
module.exports = {
    calcularMaoDeObra, verificarGarantia, calcularTotal, 
};