
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
    
    
    
