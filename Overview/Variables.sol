// SPDX-License-Identifier: GPL-3.0
// SPDX-License-Identifier: MIT

pragma solidity 0.8.2; //specific version
pragma solidity ^0.8.0; // version from 0.8.0 to 0.8.max it can't be 0.9
pragma solidity >=0.7.0 <0.9.0; //version beetween 0.7 and 0.9

contract Variables {
    //contract like class

    address nameaddress; //address for eter blockchain
    bool nameBool = true; // a true or faluse variable

    uint nameUint; //number >=0 uint = uint256
    uint256 nameUint256 = 47; // 2^256-1max , this uint was given 47
    uint8 nameUint8; //2^8-1

    int nameInt; //number +-=0
    int public constant nameInt1 = -47; //publichen int constanta ne se promenq i se vijda (moje i uint i bool i bytes sas public constanta)
    int8 nameInt8; //2^8-1 limited number

    string nameString;
    string public constant nameStrong1 = "ooo petio"; //string publichen moje da se vidi kato pusnem prog i constanta ne moje da promenq
    string nameString2 = "Hello this is string"; //string for big text '/"

    bytes nameBytes = "this is for short text"; //bytes more effecent for the blockchain limited charakters bytes32=bytes
    bytes8 nameBytes8;

    uint[] nameArrayNumbers = [1, 2, 3, 4]; //array with nmumbers
    string[] nameArrayText = ["hi", "hey", "hello"]; //array with text
    nameStruct[] nameArrayStruct; //array with struct that below

    struct nameStruct {
        //struct with variables
        string name;
        uint8 age;
        uint32 height;
    }
    nameStruct nameGeorge = nameStruct("George", 47, 178); //calling struct saying name , calling struct again and typing the variables

    function addStruct(string memory _name, uint8 _age, uint32 _height) public {
        nameArrayStruct.push(nameStruct(_name, _age, _height)); //we push the variables we named George in the array
    }

    struct Book {
        string title;
        string author;
    }
    // mapping (key => mapping(key2 => value2)) public mymapping2;
    mapping(address => mapping(uint => Book)) public myBooks;
}

contract DT {
    uint public myUint = 1; //number >= 0
    int public myInt = -1; // +-= 0
    string public myString = "String name"; //tekst v kavichki '/"
    bool public myBool = true; // za true ili faulse samo

    uint public constant myConstant = 47; // constanta ne se promenq
}
