// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;
pragma abicoder v2;

contract Profile {
    uint public Coins;

    struct person {
        string fname;
        string lname;
        uint year;
        uint tokens;
    }

    mapping(address => person) public info;

    function add(
        string memory _fname,
        string memory _lname,
        uint _year,
        uint _tokens
    ) public {
        info[msg.sender] = person(_fname, _lname, _year, _tokens);
    }
}
