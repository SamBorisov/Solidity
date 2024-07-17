// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint count;

    constructor() {
        count = 1;
    }

    function getCount() public view returns (uint) {
        return count;
    }

    function incrementCount() public {
        count = count + 1;
    }
}

contract CounterMinimal {
    uint public count = 1;

    function incrementCount() public {
        count++;
    }
}
