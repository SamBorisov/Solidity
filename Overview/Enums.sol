// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Enums {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function cancel() public {
        require(status == Status.Pending);
        status = Status.Canceled;
    }

    function ship() public {
        require(status == Status.Pending);
        status = Status.Shipped;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }

    function rejectDelivery() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }
}

contract Enums2 {
    enum Level {
        rookie,
        mafia,
        boss,
        UgaBuga
    }
    Level public lv;

    function NextLevel() public {
        lv = Level(uint(lv) + 1);
    }
}