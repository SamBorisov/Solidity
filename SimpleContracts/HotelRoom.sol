// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract HotelRoom {
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    modifier OnlyFree() {
        require(currentStatus == Statuses.Vacant, "Cuurently Occupied");
        _;
    }
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough Ether");
        _;
    }

    receive() external payable OnlyFree costs(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}
