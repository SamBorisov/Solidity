# Solidity
Syntax:
    
pragma >= 0.?.? <0.?.0;                                                  //Version of solidity

  contract ContractName {                                                        //Contract like class  
                    uint8 myUint8 =1;                                      //uint for small fixed numbers
                    uint256 myUint256=1;                                   //uint for bigger numbers (by default is this)=uint
                    uint public myUint =1;                               //number >= 0
                    int public myInt =-1;                                  // +-= 0
                    string public myString = "String name";             //tekst v kavichki '/"
                    bool public myBool = true;                         // za true ili faulse samo
                    uint public constant myConstant =47;                    // constanta ne se promenq
                    bytes32 public mybytes32 = "hello bytes"                   //neshto kato string
    
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
                                                                                               //moje da v skovi()  da pishem imeto na promenilvata v funk i modiiera da q e qsno
  


  function addPlayer(string memory firstName, string memory lastName) public{           //funkciq s koqto svarzvame structorata v skobi i slagame memory da se zapomnqt
        players.push(Player(firstName, lastName));
        playerCount +=1;

}

    struct Person{                                                                              //druga structora s vikane
        uint id;
        string name;
    }
    
    Person public Myid = Person(22,"Sam");
}

External contracts / is / Cont public externalContract = Cont(address on cont);
                                                                            Key Word

Address: Every account and smart contract has an address. It is used to send and receive Ether from one account to another. You can consider it your public identity on the Blockchain.

Mapping: Data type used to store associations. Similar to a list but holding 2 values, and allow you to quickly get the value corresponding to a key.

Event: When you call an event, it causes the arguments to be stored in transaction's log.
Emit: keyword used to call Events 

Constructor: function that is run directly when the contract is created or deplyed in the the blockchain/it can be run once and only once

msg: keyword that allows us to access some special variables that are available for us from the blockchain.

Require: Convenience function in solidity. It guarantees validity of conditions that cannot be detected before execution.

Constant: keyword added to a variable that tells solidity it cannot be changed

struct: Struct types are used to represent a record. That allow you to create your own data type.

enum: Enums restrict a variable to have one of only a few predefined values. The values in this enumerated list are called enums.

arrey: player[] public players;

modifier: can be used to chnage the behaviour of functions in a declarative way. For example you can used a modifier to automatically check a condition prios to exectuing the function.

msg.sender: The user that calls this function

super: keyword to add other constructor modifiers you shoud add in the function

msg.sender: the person who call the function

msg.value: if it's payable the eather it sender 1e18 or 1000000...

now: timestamp for the curroent time

indexed: The indexed parameters for logged events will allow you to search for these events using the indexed parameters as filters.











