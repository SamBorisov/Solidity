// SPDX-License-Identifier: GPL-3.0
pragma solidity ^ 0.7.0;
pragma abicoder v2;


contract main{
    uint public Coins;
    
    struct person{
        string fname;
        string lname;
        uint year;
        uint tokens;
    }
    
    mapping(address => person) public info;
    
    
    function add(address human, string memory _fname, string memory _lname, uint _year, uint _tokens)public {
        require(msg.sender == human, samo za sebe si mojesh);
        info[human] = person(_fname,_lname, _year, _tokens);
    }
    
}
