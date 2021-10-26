// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


                          //monetata ne mje da se prashta 30 sek sled kato e mintnata


contract Coin {
    
    uint contractStartTime;
    address public develpoer;
    mapping (address => uint) public stoinost;
    
    event record(address from, address to, uint amount);
    
    modifier onlyOwner{
                require(msg.sender == develpoer, "Only developer can call it");
                _;
        
    }
    
     modifier MaxMint(uint amount){
                require(amount < 10000);
                _;
        
    }
    
    constructor(){
        develpoer = msg.sender;
        contractStartTime = block.timestamp;
        
    }
    
    function create(address receiver, uint amount) public onlyOwner MaxMint(amount) {

        stoinost[receiver] += amount;
        
    }
    
    function transaction(address sender, address receiver, uint amount) public{
        require(block.timestamp >= contractStartTime + 30);
        require(amount <= stoinost[sender], "Insufficient funds");
        stoinost[sender] -= amount;
        stoinost[receiver] += amount;
        emit record(msg.sender, receiver, amount);
        
    }
}



                                            Druga zadacha:
                                            
                                     //levela na playera ne moje da se promeni 20 sek ot kogato e napraven       
                                            

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
        uint createdTime;
        
    }
    
    function addPlayer(string memory firstName, string memory lastName) public{

        players[msg.sender] = Player(msg.sender,Level.newbie, firstName, lastName, block.timestamp);
        playerCount +=1;
      
    }
    function getPlayerLevel(address playerAddress) public view returns(Level){
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }
    
    function changeLevel(address playerAddress) public {
         Player storage player = players[playerAddress];
         if (block.timestamp >= player.createdTime + 20)
            {
               player.playerLevel = Level.medium; 
            }
    }
    
    
    
}
