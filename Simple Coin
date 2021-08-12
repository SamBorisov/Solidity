// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public develpoer;
    mapping (address => uint) public stoinost;
    
    event record(address from, address to, uint amount);
    
    constructor(){
        develpoer = msg.sender;
        
    }
    
    function create(address receiver, uint amount) public {
        require(msg.sender == develpoer);
        require(amount < 10000);
        stoinost[receiver] += amount;
        
    }
    
    function transaction(address sender, address receiver, uint amount) public{
        require(amount <= stoinost[sender], "Insufficient funds");
        stoinost[sender] -= amount;
        stoinost[receiver] += amount;
        emit record(msg.sender, receiver, amount);
        
    }
}
