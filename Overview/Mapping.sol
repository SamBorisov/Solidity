// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Mappings {
    //   mapping(key => value) mymapping;
    mapping(uint => string) public FavBook;

    constructor() {
        FavBook[1] = "Rich Poor Dad";
        FavBook[2] = "The Laws of Human Nature";
        FavBook[3] = "Strech";
    }
    // just some mapping data into the blockchain
}

contract Mapping1 {
    /// @notice mapping key value storage
    /// @dev mapping(key => value) mymapping;
    mapping(uint => string) public names;
    mapping(uint => Book) public books;

    /// @notice nested mapping
    /// @dev mapping (key => mapping(key2 => value2)) public mymapping2;
    mapping(address => mapping(uint => Book)) public myBooks;

    /// @notice: nested mappings could be dangerous if we delete the parent mapping, since the child mapping value still be there

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Eva";
        names[3] = "Gogo";
    }

    function addBook(
        uint _id,
        string memory _titile,
        string memory _author
    ) public {
        books[_id] = Book(_titile, _author);
    }

    function addmybook(
        uint _id,
        string memory _titile,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_titile, _author);
    }
}

contract Mappings2 {
    mapping(uint => Book) public books;

    struct Book {
        string title;
        string author;
    }

    function addBook(
        uint _id,
        string memory _titile,
        string memory _author
    ) public {
        books[_id] = Book(_titile, _author);
    }

    //mapping num with struct for book for adding a book 'memory' for remebering

    // mapping (key => mapping(key2 => value2)) public mymapping2;
    mapping(address => mapping(uint => Book)) public AddressBooks;

    //if mapping is epmty it will have default value

    function addmybook(
        uint _id,
        string memory _titile,
        string memory _author
    ) public {
        AddressBooks[msg.sender][_id] = Book(_titile, _author);
    }
    //double mapping for adding book on ower address
}

contract Mappings3 {
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        //get infro in mapping not need if mapping is public and don't ahve other reqires
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        //set the num into the the addres we choose
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        //delete a num into a mapping
        delete myMap[_addr];
    }
}

contract Mappings4 {
    mapping(address => uint) public wallet;

    function ll() external {
        wallet[msg.sender] = 60; //add

        wallet[msg.sender]; //read

        wallet[msg.sender] = 56; //update

        delete wallet[msg.sender]; //delete
    }
}

contract Mappings5 {
    mapping(address => mapping(address => bool)) public aprove;

    function ap(address _addr) public {
        aprove[msg.sender][_addr] = true; //add
        aprove[msg.sender][_addr]; //read
        aprove[msg.sender][_addr] = false; //update
        delete aprove[msg.sender][_addr]; //delete
    }
}

contract Mappings6 {
    mapping(address => uint[]) public score;

    function sc() public {
        score[msg.sender].push(1); //add
        score[msg.sender].push(10); //add
        score[msg.sender][0]; //read
        score[msg.sender][0] = 2; //update
        delete score[msg.sender][1]; //delete
    }
}
