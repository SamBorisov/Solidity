// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract MyCon{
    //mapping key value storage
 //   mapping(key => value) mymapping;
    mapping(uint => string)public names;
    mapping(uint=> Book) public books;
    
    
   // mapping (key => mapping(key2 => value2)) public mymapping2;
    mapping (address => mapping(uint => Book)) public myBooks;
    
    
    
    
    
    
    
    
    struct Book{
        string title;
        string author;
    }
    
    
    constructor() public {
        names[1] = "addam";
        names[2] = "carl";
        names[3] = "Gogo";
    }

    function addBook (uint _id, string memory _titile, string memory _author) public{
        books[_id]=Book(_titile,_author);
    }
    
    
    function addmybook(uint _id, string memory _titile, string memory _author)public{
        myBooks[msg.sender][_id] = Book(_titile, _author);
    }
}
