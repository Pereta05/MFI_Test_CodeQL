const express = require('express');
const app = express();

app.get('/ejecutar', (req, res) => {
    // ❌ VULNERABILIDAD: Se recibe un parámetro del usuario sin validar
    let codigoUsuario = req.query.texto; 
    
    // 🚨 AQUÍ ESTÁ EL ERROR CRÍTICO:
    // CodeQL detectará que 'codigoUsuario' (un dato "contaminado") llega a 'eval()'
    let resultado = eval(codigoUsuario); 
    
    res.send("Resultado: " + resultado);
});
