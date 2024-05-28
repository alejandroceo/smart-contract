Explicación del código:
Variables públicas:

name: El nombre del token (BitcoinToken).
symbol: El símbolo del token (BTC).
decimals: Los decimales del token (8, igual que Bitcoin).
totalSupply: El suministro total de tokens (21 millones * 10^8 para considerar los decimales).
Mapeos:

balanceOf: Almacena los saldos de los usuarios.
allowance: Almacena las asignaciones aprobadas para gastar en nombre de otros usuarios.
Eventos:

Transfer: Se emite cuando se realiza una transferencia de tokens.
Approval: Se emite cuando se aprueba una asignación de tokens.
Constructor:

Inicializa las variables del token.
Asigna el suministro inicial al creador del contrato.
Funciones:

transfer: Permite transferir tokens a otra dirección.
approve: Permite aprobar a otra dirección para gastar tokens en tu nombre.
transferFrom: Permite transferir tokens desde una dirección aprobada.

Desplegar el contrato en Remix:
En la pestaña "Deploy & run transactions", selecciona tu contrato BitcoinToken en el desplegable.
Haz clic en "Deploy" para desplegar tu contrato en la red seleccionada.

Este contrato ERC20 tiene las mismas características que Bitcoin en términos de suministro total y decimales. Puedes personalizar el contrato según tus necesidades si deseas añadir funcionalidades adicionales.
