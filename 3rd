// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract DT {
    
    uint public myUint =1; //number >= 0
    int public myInt =-1; // +-= 0
    string public myString = "String name"; //tekst v kavichki '/"
    bool public myBool = true;  // za true ili faulse samo
    
    uint public constant myConstant =47; // constanta ne se promenq
    
}


contract myGame {
    
    uint public playerCount = 0;
    Player[] public players;
    
    
    struct Player {
        string firstName;
        string lastName;
        
    }
    
    function addPlayer(string memory firstName, string memory lastName) public{
        players.push(Player(firstName, lastName));
        playerCount +=1;
    }
}




// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract myGame {
    
    uint public playerCount = 0;
    mapping (address => Player) public players;
    
    enum Level {newbie , medium , hardcore}
    
    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        
    }
    
    function addPlayer(string memory firstName, string memory lastName) public{
      //  if (players[msg.sender] == null){
      //  require (players[msg.sender] == null);
        players[msg.sender] = Player(msg.sender,Level.newbie, firstName, lastName);
        playerCount +=1;
        // }
    }
    function getPlayerLevel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel;
    }
}
