/// @dev State variables vs local variables:
// State variables are persisted on the blockchain after a smart contract finish to execute, whereas local variables live only during the execution of a function.

            contract A {
                      //state variable
                          uint a;

                         //functions
                         function foo() {
                          uint b; //local variable
                     }
                    }


/// @dev How to declare a mapping of address to mapping of address to booleans (nested mapping)

                 mapping(address => mapping(address => bool)) a;
                 
                 
/// @dev How to add data to an array declared as a state variable? and then mapping

                        uint[] a;

                        function add(uint newEntry) external {
                        add.push(a);
                         }

                       mapping(address => bool) a;

                        function add(address addr) external {
                           a[addr] = true;
                         }

                    // Loop array:

                        uint[] a;

                        function loop() external {
                          for(uint i = 0; i < a.length; i++) {
                            //do something with a[i]
                            //reading: uint a = arr[i]
                            //writing: arr[i] = a
                          }
                        }

/// @dev How to throw an error in Solidity?


                        function throwError() external {
                          require(a != b, 'My error message');
                          if (a == b) {
                            revert('My error message');
                          }
                          assert(a != b);
                        }
                        
                        
/// @dev Instance struct:
    
                struct User {                       
                 address id;
                  string name;
                }

               //Method 1 (argument order matters)
                const user = User("0xAio90....", "Mike");

                //Method 2 (argument order does not matter)
                const user1 = User({name: "Mike", id: "0xAio90...."});

/// @dev Inner mapping:
  
                  struct User {
                    address id;
                    string name;
                      mapping(address => bool) friends;
                  }
                      //let assume the User struct is stored inside a mapping
                    mapping(address => User) users;

                    //Inside a function, you would instantiate your struct like this
                    function foo() {
                      users["0xAio90..."].id = "0xAio90...";
                      users["0xAio90..."].name = "Mike";
                      users["0xAio90..."].friends["0xIopop..."] = true;
                      users["0xAio90..."].friends["0xjk89I..."] = true;
                    }
    
    
/// @dev Let's consider this struct
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
          
          
/// @dev How to define an in-memory array of 3 integers?
          
          uint[] arr = new uint[](3);


/// @dev How to add a value to an in-memory array?

        uint[] arr = new uint[](3);

        function add(uint a) external {
            uint[0] = 1;
            uint[1] = 2;
            uint[2] = 3;
            uint[3] = 1; //out-of-bounds error
        }

    
    
    
    
/// @dev How to make a contract A inherit from a contract B in Solidity?
      
                           // First import the contract if needed
                           //import "./B.sol";  
                          contract B {
                            //...
                          }

                          //Then make your contract inherit from it
                          contract A is B {

                            //Then call the constructor of the B contract
                           constructor() B() {}
                          }
                          
                          
                          
/// @dev If A inherit from B, and both define the same function foo, which one will be resolved?
   
                  //Case 1

                                  contract B {
                                    function foo() external {}
                                  }
                                  contract A is B {
                                     function foo() external {}
                                  }
                                  // If I call foo() on A, the function A.foo() will be resolved

                    //Case 2

                                  contract B {
                                     function foo(uint data) external {}
                                  }
                                  contract A is B {
                                     function foo() external {}
                                  }
                                  
                                  
                                  
/// @dev How to concatenate 2 strings a, b?
//Use the abi.encodePacked() function:

                    const concatenate = string(abi.encodePacked(a, b));

/// @dev  How to get the length of a string in solidity?
 
                          bytes byteStr = bytes(a); //a is a string
                          const lenght = bytesStr.length;


/// @dev How to to create a smart contract from a smart contract?

                      contract A {
                        constructor(uint a) {}
                        function foo() external {}
                      }

                      contract B {
                        function createA(uint a) external {
                          A AInstance = new A(a); //pass constructor argument(s) if any
                        }
                      }
                      
                      
/// @dev How to to call another smart contract from a smart contract?

                            contract A {
                              function foo() view external returns(uint) {}
                            }

                            contract B {
                              function callFoo(address addrA) external {
                                uint result = A(addrA).foo();
                              }
                            }    
                            
                            
                            
/// @dev How to get the address of a smart contract that was deployed from a smart contract?
  
// Using the address() operator to cast the contract type into an address:

                        address childAddress = address(new Child());
                        
                        
                        
                        
 /// @dev What will be the value of msg.sender if a contract calls another one?
 
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


/// @dev How to transfer ERC20 tokens?

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
                        }
                          
                          
/// @dev How to declare and emit an event?

                            contract A {
                              //declare event
                              event TokenSent(uint amount, address to);
                              function sendToken(uint amount, address to) external {
                                 //Emit event
                                 emit TokenSent(amount, to); //careful, old Solidity 0.4 code did not require the emit keyword, dont be confused
                              }
                            }      
                            
                            
/// @dev What is the indexed keyword in event definition?
 
//If an event field is declared with the indexed keyword, it means that external entities can filter only events whose field match a specific value. For example, in the below example, it means it’s possible to filter events with a to field equal to a specific value.

                        event TokenSent(uint amount, address indexed to);     
                        
    
    
/// @dev How would you implement access control without modifier?

                        contract A {
                          address admin;
                          constructor() {
                             admin = msg.sender;
                          }

                          function protectedFunction() external {
                            require(msg.sender == admin, 'only admin');
                          }
                        }
                        
/// @dev How would you implement access control WITH modifier?

                        contract A {
                          address admin;
                          constructor() {
                             admin = msg.sender;
                          }

                          function protectedFunction() external onlyAdmin() {
                            //...
                          }

                          modifier onlyAdmin() {
                            require(msg.sender == admin, 'only admin');
                            _;
                          }
                        }   
           
           
           
/// @dev Create a function to determine if another address is a contract or a regular address

                                   function isHuman(address addr) external {
                                      uint256 codeLength;

                                      assembly {codeLength := extcodesize(addr)}
                                      return codeLength == 0 ? true : false;
                                    }
                                  
                                  
/// @dev How to declare assembly code?

                        contract Assembly {

                          function foo() external { 
                              assembly {
                                //assembly code here
                              }   
                          }
                        } 
          
                                    
/// @dev How to generate a random integer in Solidity?
// We can leverage the block.timestamp and block.difficulty as a source of randomness, and use the keccak256() hashing function:
// Be aware it is impossible to generate a truly random number in Solidity, as the blockchain is deterministic. That's why people use oracles!

                        const random = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));


/// @dev How to produce a hash of multiple values in Solidity?

                        const hash = keccak256(abi.encodePacked(a, b, c));                                  
                                    

/// @dev What is a re-entrancy attack?
// A re-entrancy attack happen when a contract A calls a contract B which call back the calling function on contract A to perform some malicious effect. 
// Example with a DAO-like attack:

              contract A {
                //...
                function pay(address payable to, uint amount) external {
                  if(amount <= balances[msg.sender]) {
                    B(to).badFunction().send(amount);
                    balances[msg.sender] -= amount;
                }
              }
            }


              contract B {
                address;
                function badFunction(address payable to) external {
                  ContractA(msg.sender).pay();
                }
              }
                  
/// @dev When is a library embedded vs deployed?

                        //Embedded (function is internal)
                        library Lib {  
                          function add(uint a, uint b) pure internal returns(uint) {
                            return a + b;
                          }
                        }

                        //Deployed (function is public)
                        library Lib {  
                          function add(uint a, uint b) pure public returns(uint) {
                            return a + b;
                          }
                        }
                        
                        
/// @dev Give an example of how to use a library in a smart contract
 
                                  library Lib {  
                                    function add(uint a, uint b) pure internal returns(uint) {
                                      return a + b;
                                    }
                                  }

                                  contract A {
                                    using Lib for uint;

                                    function add(uint a, uint b) pure external returns(uint) {
                                      return a.add(b);
                                    }
                                  }
                                                   
