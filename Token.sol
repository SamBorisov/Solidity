// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;




contract Token {
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;

    
    mapping(address => uint) public Balance;
    
    event Transfer(address indexed from , address indexed to, uint value);
    
    constructor (string memory _name, string memory _symbol, uint _decimals, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        Balance[msg.sender] = _totalSupply;
    }
    
    function transfer(address _to, uint _value) external returns (bool succsess){
        require(Balance[msg.sender] >= _value , "Not enough tokens");
        Balance[msg.sender] = Balance[msg.sender] - (_value);
        Balance[_to] = Balance[_to] + (_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
}
