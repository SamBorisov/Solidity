
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

public - all can access

external - Cannot be accessed internally, only externally

internal - only this contract and contracts deriving from it can access

private - can be accessed only from this contract - default variables (all data on blockchain is public so it's not so private)
You either don’t put private data on the blockchain, or you put hashes.

                                           Interview
prove of work(more than 51% need to do the task) / prove of stake (one need to do other so validate)
Layer 1(base layer) -> Layer 2(app added on top), rollups
Sharding - blockchain of blockchains

Hash - Unique fixed length string to identify a piece of data
Hash Algorithm - a function that computes data into unique hash 
Mining - the processs of finding the 'solution' to the blockchain 'problem'. ( exapile : the problem was to find hash that start with 0000) Nodes get paid for mining blocks.
Block - list of transactions mined together
Decentralized - having no single point of authority
Nonce: a 'nummber used once' to find the solution to the blockchain problem. It's also used to define the transaction number for an account /address
Private key: Only know to the key holder , it's used to 'sign' transactions
Public key: Is derived from your privet key. Amyone can 'see' it , and use it to verify that a transacion came to you.

Etherum smart contract is small program that runs on the Ethereum blockchain
Once it is deplyed it cannot be stopped / hacked (as long as the code of the contract is correct) or be changed (the code is immutable , however the data is)
Smart contracts can interact with echother , however they can't call an API(Application Programming Interface) on the web!
Smart contract store limited data , string data cost gas.
Smart contracts can be written in another languages like Vyper LLL , however Solidity is the most popular 

Solidity is statically typed , variable types need to be defined , unlike dymanic languages like JavaScript
Solidity is compiled (it has to be comiled 1st before we run the code) , it's not interpreted
extension of Solidity files is .sol
1 sol file can have several smart contracts

what is the typical layout? pragma contract variables functions...ect
State variables vs local variables - State variables are persisted on the blockchain after a smart contract finish to execute, whereas local variables live only during the execution of a function.

        contract A {
          //state variable
              uint a;

             //functions
             function foo() {
              uint b; //local variable
         }
        }
        
3 data types we used often - uint addres and string , 2 container types - array and mapping
How to declare a mapping of address to mapping of address to booleans (nested mapping)
     mapping(address => mapping(address => bool)) a;
     
 25  How to add data to an array declared as a state variable? and then mapping

    uint[] a;

    function add(uint newEntry) external {
    add.push(a);
     }
     
   mapping(address => bool) a;

    function add(address addr) external {
       a[addr] = true;
     }

Loop array:

    uint[] a;
      for(uint i = 0; i < arr.length; i++) {
      //do something with arr[i] 
       //reading: uint a = arr[i]
     //writing: arr[i] = a
    }


    require(a !== b, 'My error message')  -how to throw an error

    use uint  to manage dates
    timestamp current - now 
    timestamp 1 day - now + 86400 (seconds in a day)

      2 artifacts produced by the Solidity compiler when compiling a smart contract?
   The ABI (application binary interface) -The ABI defines the interface of a smart contract, i.e the set of functions that can be called from outside the smart contract. The ABI only defines the function signatures (function names, argument types and return types) but not their implementation. The ABI also defines the events of the contract. The ABI is used outside the smart contract by Ethereum client libraries like web3 to interact with the smart contract.
    The bytecode
    
  Does the EVM understands Solidity?
No. The EVM only understand bytecode, which must first be produced by Solidity, outside of the blockchain.

  What is the EVM bytecode?
The EVM bytecode is a series of EVM elementary instructions called opcodes. These opcodes define very simple simple operations like adding 2 numbers (ADD), loading data from memory (mload), etc… There are more than 100 of these opcodes defined in the Ethereum yellow paper. Coding directly with opcodes would be very tedious, so we need higher languages like Solidity to help us reason at a higher level of abstraction.

  What are the 2 APIs used to interact with a smart contract?
eth_sendTransaction (transaction) and eth_call (call). Transactions cost money (gas) and can modify the blockchain. Calls do not cost money, cannot modify the blockchain, but can return a value contrary to transactions.

  Gas:
Gas is an abstract unit used to pay miners when sending a transaction on the Ethereum network.
Gas is paid in ether using the formula: ether cost = gasPrice * gas, where gas represents the gas cost of the execution of a transaction. gasPrice is in wei / gas, generally express is Gwei. A transaction also specifies a gasLimit parameter, which specify a maximum number of gas that can be paid by a transaction. Without this, a transaction could potentially drain an account of all its Ether.
The transaction is stopped, and all state changes are reverted if there is not enough gas
The sender of the transaction pays the gas.

famous smart contract framework for Solidity
       Truffle
       OpenZeppelin
   Remix - online IDE
Geneche  - Javascript Ethereum client can we use to develop Solidity on a local blockchain


What do you need to deploy a smart contract to the Ethereum network??
    bytecode of smart contract
    an Ethereum address with enough Ether
    A wallet to sign the transaction
    A tool to create the transaction and coordinate the signing process with the wallet
    
Famous Ethereum wallets                           netowkrs you can deplay Solidity smart contracts
    Metamask  
    MyEtherWallet                                                 Mainnet
    Ledger                                                        Ropsten
    Trezor                                                        Kovan
    
50 - define custom data 
  Struct
  Enum 
Struct are for representing complex data structures with different fields. Enum are for creating variant for a single data. Ex: a color can be red, blue, yellow. You can combine both by defining an enum, and a struct that uses this enum in a field;
    instance struct:
    
      struct User {                       
       address id;
        string name;
      }
  
     //Method 1 (argument order matters)
      User("0xAio90....", "Mike");

      //Method 2 (argument order does not matter)
      User({name: "Mike", address: "0xAio90...."});
      
  Inner mapping:
  
        struct User {
      address id;
    string name;
      mapping(address => bool) friends;
    }
      //let assume the User struct is stored inside a mapping
    mapping(address => User) users;

    //Inside a function, you would instantiate your struct like this
    users["0xAio90..."].id = "0xAio90...";
    users["0xAio90..."].name = "Mike";
    users["0xAio90..."].friends["0xIopop..."] = true;
    users["0xAio90..."].friends["0xjk89I..."] = true;
    
    Array vs Mapping
    I would use an array if I need to iterate through a collection of data. And I would use a mapping if I need to rapidly lookup a specific value
    
    //Let's consider this struct
      struct User {
     uint id;
     string name;
      }

      //First, let's use an array to store all its ids
      uint[] userIds;

      //Then, let's use a mapping for rapid lookup
      mapping(uint => User) users;

          //If we need to rapidly lookup a user, we use the mapping
          //And if we need to iterate through users, we iterate through the userIds array, 
          //and for each userIf we can
          //lookup the correct user in the mapping
          
          
How to define an in-memory array of 3 integers?
          
          uint[] memory arr = new uint[](3);


How to add a value to an in-memory array?
    uint[] memory arr = new uint[](3);

    uint[0] = 1;
    uint[1] = 2;
    uint[2] = 3;
    uint[3] = 1; //out-of-bounds error
    
How to get the list of all keys in a mapping (like Object.keys() in Javascript) - not possible, Smart contracts don’t keep track of the list of entries in a mapping.

What happen if you try to access the key of a mapping that does not exist?
Contrary to arrays, there is no error, Solidity will give you a value, which is the default value of the type.

          mapping(uint => bool) myMap;
          
          
61-What are the 3 mechanisms for code re-use in Solidity?

      Group common codes in functions
      Contract inheritance
      Libraries
      
      
How to make a contract A inherit from a contract B in Solidity?
      
                           // First import the contract
                          import B from 'path/to/B.sol';

                          //Then make your contract inherit from it
                          contract A is B {

                            //Then call the constructor of the B contract
                           constructor() B() {}
                          }
      
      
   If A inherit from B, and both define the same function foo, which one will be resolved?
   
                  //Case 1

                                  contract B {
                                             function foo() external {...}
                                  }
                                  contract A is B {
                                     function foo() external {...}
                                  }
                                  If I call foo() on A, the function A.foo() will be resolved

                    //Case 2

                                  contract B {
                                     function foo(uint data) external {...}
                                  }
                                  contract A is B {
                                     function foo() external {...}
                                  }
      
      
What are the 4 memory locations of Solidity?

                        Storage, Memory, Stack and Calldata


What is the default visibility of state variables?

                            Private
                            
                            
                            
                            
                            What is the difference between address and address payable?
Only address payable can receive money

               Is it necessary to make an address address payable to transfer ERC20 tokens?
No. The payable requirement is only required for native Ether. Ethereum has no knowledge of ERC20 tokens. For Ethereum, this is just a variable in a smart contract, like any other variables.

Give 3 ways to save gas
                  Put less data on-chain
                  Use events instead of storage
                  Optimal order for variable declaration. See this link.
                  
How would optimally order uint128, bytes32 and another uint128 to save gas?
uint128
uint128
bytes32
The EVM stores variable in 32-bytes slot. However Solidity is smart enough to pack into a single slot several variables if they can fit together. For this optimization to work, packed variables have to be defined next to each other. In the above example, the 2 uint128 will be placed in the same 256 bit slots (128 + 128 = 256).


How to concatenate 2 strings a, b?
Use the abi.encodePacked() function:

                        string(abi.encodePacked(a, b));

 How to get the length of a string in solidity?
 
                          bytes memory byteStr = bytes(a); //a is a string
                          bytesStr.length;


How to to create a smart contract from a smart contract?

                      contract A {
                        constructor(uint a) {...}
                        function foo() external {...}
                      }

                      contract B {
                        function createA(uint a) external {
                          A AInstance = new A(a); //pass constructor argument(s) if any
                        }
                      }
                      
                      
How to to call another smart contract from a smart contract?

                            contract A {
                              function foo() view external returns(uint) {...}
                            }

                            contract B {
                              function callFoo(address addrA) external {
                                uint result = A(addrA).foo();
                              }
                            }    
                            
                            
                            
How to get the address of a smart contract that was deployed from a smart contract?
  
Using the address() operator to cast the contract type into an address:

                        address childAddress = address(new Child())
                        
                        
                        
                        
 76-What will be the value of msg.sender if a contract calls another one?
 
                          //This is the inner contract
                          contract A {
                            function bar() view external returns(address) {
                               //What will be the value of `msg.sender` here?
                            }
                          }

                          //This is the outer contract
                          contract B {
                              function foo() external {
                                  A aInstance = new A();
                                   aInstance.bar();
                              }
                          }


How to transfer ERC20 tokens?

                        contract ERC20Interface {
                          function totalSupply() public view returns (uint);
                          function balanceOf(address tokenOwner) public view returns (uint balance);
                          function allowance(address tokenOwner, address spender) public view returns (uint remaining);
                          function transfer(address to, uint tokens) public returns (bool success);
                          function approve(address spender, uint tokens) public returns (bool success);
                          function transferFrom(address from, address to, uint tokens) public returns (bool success);

                          event Transfer(address indexed from, address indexed to, uint tokens);
                          event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
                        }

                        contract DecentralizedExchange {
                          function transferToken(address ERC20Address, address to, uint amount) {
                            ERC20Interface(ERC20Address).transfer(to, amount);
                          }
                          
                          
How to declare and emit an event?

                            contract A {
                              //declare event
                              Event TokenSent(uint amount, address to);
                              function sendToken(uint amount, address to) external {
                                 ...
                                 //Emit event
                                 emit TokenSent(amount, to); //careful, old Solidity 0.4 code didnt not require the emit keyword, dont be confused
                              }
                            }    
                            
 What is the indexed keyword in event definition?
 
If an event field is declared with the indexed keyword, it means that external entities can filter only events whose field match a specific value. For example, in the below example, it means it’s possible to filter events with a to field equal to a specific value.

                        Event TokenSent(uint amount, address indexed to);          
                        
  How many event fields can be marked indexed?
3 maximum.   

Is it possible for a smart contract to read the events emitted before?
No. Only external entities can queries events.

Is it possible to delete or modify a past event?
No. Events are immutable.

In Solidity, how to do like a Javascript console.log for debugging?
There is no equivalent in Solidity, but you can use events, even if its not designed for this.



How would you implement access control without modifier?

                        contract A {
                          address admin;
                          constructor() {
                             admin = msg.sender;
                          }

                          function protectedFunction() external {
                            require(msg.sender == admin, 'only admin');
                            ...
                          }
                        }
                        
How would you implement access control WITH modifier?

                        contract A {
                          address admin;
                          constructor() {
                             admin = msg.sender;
                          }

                          function protectedFunction() external onlyAdmin() {
                            ...
                          }

                          modifier onlyAdmin() {
                            require(msg.sender == admin, 'only admin');
                            _;
                          }
                        }   
                        
                        
 How to cancel a transaction?
 
Once a transaction has been sent, nobody can prevent it from being mined by a miner. But you can still send another transaction preventing the first one from working IF its mined before the first one. This second transaction will have the following properties:

it will have the same nonce (i.e an incrementing integer that is sent in each transaction, specific to each Ethereum address)
it will have a higher gasPrice than the first transaction
it will send a tiny amount of Ether to another address
Let’s review why we need these. The same nonce means that the first transaction to be mined will prevent the other one from being mined: miners only mine transactions whose nonce is higher than the previous nonce for the address that has signed the transaction.

The higher gasPrice means a higher reward for miner, so if a miner has the choice to mine the second or the first transaction he will choose the second one.

And finally, sending a tiny amount of Ether is just because a transaction needs to do something on the blockchain, so we just do something that is useless but doesn’t cost us much. Actually, you could even call a read-only function in any smart contract, in a transaction, and you wouldn’t even need to send this tiny amount of Ether. You would still need to cover the gas fee in every case.  

Difficult 87:
