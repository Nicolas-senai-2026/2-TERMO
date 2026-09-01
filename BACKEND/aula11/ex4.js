const entrada = require('readline-sync');

function converterParaFahrenheit(celsius) {
    let Fahrenheit = (celsius * 9/5) + 32;
    return Fahrenheit;
}

const tempC = entrada.questionFloat("Digite a temperatura em celsius: ");

const tempF = converterParaFahrenheit(tempC);

console.log(`A temperatura convertida foi: ${tempF.toFixed(1)}°F`);