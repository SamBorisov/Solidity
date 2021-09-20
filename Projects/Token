// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract prog{
    
    uint public tokens = 1000000;
    
    address minter;
    mapping(address=>uint) public balance;
    
    constructor(){
        minter = msg.sender;
    }
    
    
    function mint(uint minted) public{
        require(msg.sender == minter , "samo mintera moje da pravi moneti");
        tokens = tokens + minted;
        
    }
    
    function send(address reciver, uint nagrada) public{
        require(msg.sender == minter , "samo mintera moje da nagrajdava");
        require(tokens >= nagrada, "nqma dostatachno tolkeni");
        balance[reciver] = balance[reciver] + nagrada;
        tokens = tokens - nagrada;
    }
    
    function transaction(address giver, address reciver, uint given) public{
        require(giver == msg.sender,"ne si toq da davash");
        require(balance[giver] >= given, "nqmash dostatachno parichki");
        balance[giver] = balance[giver] - given;
        balance[reciver] = balance[reciver] + given;
        
    }   
    
    
    
    
}
