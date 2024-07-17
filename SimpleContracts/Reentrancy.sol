// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyExample {
    mapping(address => uint256) private balances;
    bool private locked;

    modifier noReentrancy() {
        require(!locked, "Reentrancy detected");
        locked = true;
        _;
        locked = false;
    }

    function withdraw(uint256 amount) external noReentrancy {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Check
        balances[msg.sender] -= amount;

        // Effect
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        // Interaction
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
