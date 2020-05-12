function limite_textarea_prob(valor) {
    quant = 255;
    total = valor.length;
    if(total <= quant) {
        resto = quant - total;
        document.getElementById('contProb').innerHTML = resto;
    } else {
        document.getElementById('descricaoProblema').value = valor.substr(0,quant);
    }
}

function limite_textarea_obs(valor) {
    quant = 255;
    total = valor.length;
    if(total <= quant) {
        resto = quant - total;
        document.getElementById('contObs').innerHTML = resto;
    } else {
        document.getElementById('obs').value = valor.substr(0,quant);
    }
}

function limite_textarea_resolu(valor) {
    quant = 255;
    total = valor.length;
    if(total <= quant) {
        resto = quant - total;
        document.getElementById('contResolu').innerHTML = resto;
    } else {
        document.getElementById('resolucao').value = valor.substr(0,quant);
    }
}