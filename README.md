# Solidity
Syntax:
    
pragma >= 0.?.? <0.?.0;                                                  //Version of solidity

  contract ContractName {                                                        //Contract like class  
                    uint public myUint =1;                               //number >= 0
                    int public myInt =-1;                                  // +-= 0
                    string public myString = "String name";             //tekst v kavichki '/"
                    bool public myBool = true;                         // za true ili faulse samo
                    uint public constant myConstant =47;                    // constanta ne se promenq
    
}


struct Player {                                                     //structor v contracta v koqto imame stoinosti
        string firstName;
        string lastName;
          }

  function addPlayer(string memory firstName, string memory lastName) public{           //funkciq s koqto svarzvame structorata v skobi i slagame memory da se zapomnqt
        players.push(Player(firstName, lastName));
        playerCount +=1;






















}

