// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinToken {
    // Variables públicas del token
    string public name = "BitcoinToken";
    string public symbol = "BTC";
    uint8 public decimals = 8;
    uint256 public totalSupply = 21000000 * 10 ** uint256(decimals);

    // Mapeo para almacenar los saldos de los usuarios
    mapping (address => uint256) public balanceOf;
    // Mapeo para almacenar las asignaciones de los usuarios
    mapping (address => mapping (address => uint256)) public allowance;

    // Eventos necesarios
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor que se ejecuta al desplegar el contrato
    constructor() {
        balanceOf[msg.sender] = totalSupply; // Asigna el suministro inicial al creador del contrato
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // Función para transferir tokens
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Destino no válido");
        require(balanceOf[msg.sender] >= _value, "Saldo insuficiente");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Función para aprobar a un gastador
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Función para transferir tokens desde una cuenta aprobada
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Destino no válido");
        require(balanceOf[_from] >= _value, "Saldo insuficiente");
        require(allowance[_from][msg.sender] >= _value, "Asignación insuficiente");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
