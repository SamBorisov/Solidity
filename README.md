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

modifier NameModif {                                                    //modifier s ime NameModif
        require(uint == 4,'uint need to be 4');                            //kakav e argumenta na modifiera (tuka uint da e 4)
        _;                                                                    // tova vinago go ima na kraq na modifiera
        }




struct Player {                                                     //structor v contracta v koqto imame stoinosti
        string firstName;
        string lastName;
          }

function addPlayer(string memory firstName, string memory lastName) public Namemodif{           //funkciq v koqto vikame modifiera , prosto se dobavq imeto sled public 
                                                                                                   //moje nqkolko modifiera prosto pishem space i pishem drugoto ime 
   


  function addPlayer(string memory firstName, string memory lastName) public{           //funkciq s koqto svarzvame structorata v skobi i slagame memory da se zapomnqt
        players.push(Player(firstName, lastName));
        playerCount +=1;





















}

