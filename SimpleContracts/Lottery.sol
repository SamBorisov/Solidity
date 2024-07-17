// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    uint256 public entryFee;
    address[] public players;
    address public winner;

    event NewPlayer(address indexed player);
    event Winner(address indexed winner, uint256 prize);

    constructor(uint256 fee) {
        manager = msg.sender;
        entryFee = fee;
    }

    function enter() public payable {
        require(msg.value == entryFee, "Incorrect entry fee");
        players.push(msg.sender);
        emit NewPlayer(msg.sender);
    }

    function random() private view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.prevrandao, block.timestamp, players)
                )
            );
    }

    function pickWinner() public restricted {
        require(players.length > 0, "No players in the lottery");
        uint256 index = random() % players.length;
        winner = players[index];
        uint256 prize = address(this).balance;

        payable(winner).transfer(prize);
        players = new address[](0);

        emit Winner(winner, prize);
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    modifier restricted() {
        require(
            msg.sender == manager,
            "Only the manager can call this function"
        );
        _;
    }
}
