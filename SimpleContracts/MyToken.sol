// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract CustomToken {
    string public name;
    string public symbol;
    uint public decimals;
    uint public maxSupply;
    uint public totalSupply;
    uint public tokensInContract;

    address supplyController;
    mapping(address => uint) public balance;

    event record(address from, address to, uint amount);
    event gifted(address to, uint amount);
    event minted(uint amount);

    constructor() {
        supplyController = msg.sender;
        totalSupply = 1000;
        tokensInContract = 1000;
        name = "CustomToken";
        symbol = "CT";
        decimals = 18;
        maxSupply = 1000000;
    }

    modifier onlySupplyController() {
        require(
            msg.sender == supplyController,
            "only supply controller can mint"
        );
        _;
    }

    function mintToContract(uint amount) public onlySupplyController {
        require(totalSupply + amount <= maxSupply, "max supply reached");
        tokensInContract += amount;
        totalSupply += amount;

        emit minted(amount);
    }

    function giftFromContract(address reciver, uint amount) public onlySupplyController {
        require(tokensInContract >= amount, "not enough tokens in contract");
        balance[reciver] += amount;
        tokensInContract -= amount;

        emit gifted(reciver, amount);
    }

    function transferTokens(
        address sender,
        address reciver,
        uint amount
    ) public {
        require(balance[sender] >= amount, "not enough tokens");
        balance[sender] -= amount;
        balance[reciver] += amount;

        emit record(sender, reciver, amount);
    }
}
