// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Events {
    event newTrade(
        uint indexed date,
        address indexed from, 
        address indexed to,
        uint amount,
        string massage
    );
    /// @notice filter index - make it more expesive (but could be filtered) , max 3 indexed in event
    /// @dev gass is lower in event than storage variables

    event empty();

    function tade(address to, uint amount) public {
        emit newTrade(block.timestamp, msg.sender, to, amount, "We did it");
        emit empty();
    }
}
//this logs will be stored in the blockchain but smart contracts won't be able to accsess that
