/**
 * @name Detección de uso peligroso de eval
 * @description Encuentra llamadas a la función eval() que pueden permitir ejecución de código remoto.
 * @kind problem
 * @id js/uso-peligroso-de-eval
 */

import javascript

from CallExpr llamada
where 
  // 1. Buscamos expresiones que sean llamadas a funciones
  llamada.getCalleeName() = "eval"
select 
  llamada, 
  "🚨 ALERTA DE SEGURIDAD: Se ha detectado el uso de eval(). Riesgo de ejecución de código."
