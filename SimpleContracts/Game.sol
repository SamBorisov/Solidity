// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract myGame {
    uint public playerCount = 0;
    Player[] public players;

    struct Player {
        string firstName;
        string lastName;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players.push(Player(firstName, lastName));
        playerCount += 1;
    }
}

contract myGame2 {
    uint public playerCount = 0;
    mapping(address => Player) public players;

    enum Level {
        newbie,
        medium,
        hardcore
    }

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        require(
            players[msg.sender].playerAddress == address(0),
            "Player exists"
        );
        players[msg.sender] = Player(
            msg.sender,
            Level.newbie,
            firstName,
            lastName,
            block.timestamp
        );
        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns (Level) {
        return players[playerAddress].playerLevel;
    }

    function changeLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if (block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.medium;
        }
    }
}
