// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract SimpleAuction {
    //parameters of the auction
    address payable public beneficiary;
    uint public auctionEndTime;

    //current state of the auctionEndTime
    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) public pendingReturns;

    bool ended = false;

    event highestBidIncrease(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        if (block.timestamp > auctionEndTime) {
            revert("Auction ended");
        }
        if (msg.value <= highestBid) {
            revert("There is already a same/higher bid");
        }
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncrease(msg.sender, msg.value);
    }

    function widthdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }

        return true;
    }

    function auctionEnd() public {
        if (block.timestamp < auctionEndTime) {
            revert("Auction not yet ended");
        }

        if (ended) {
            revert("Action already ended");
        }

        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        beneficiary.transfer(highestBid);
    }
}
