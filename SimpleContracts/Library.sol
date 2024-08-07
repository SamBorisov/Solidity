// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma abicoder v2;
pragma experimental ABIEncoderV2;

contract Library {
    address public owner;
    struct book {
        uint id;
        string title;
        string author;
        uint copies;
    }

    event bookBorrowed(address borrower, uint bookId);
    event bookReturned(address giver, uint bookId);

    address[] public borrowers;

    mapping(uint => book) public books;
    mapping(address => mapping(uint => bool)) public NotTaken;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function addBook(
        uint _id,
        string memory _titile,
        string memory _author,
        uint _copies
    ) public onlyOwner {
        books[_id] = book(_id, _titile, _author, _copies);
    }

    function borrow(uint _id) public {
        require(
            NotTaken[msg.sender][_id] == false,
            "The user has already borrow a book"
        );
        require(books[_id].copies > 0, "No available copies");
        books[_id].copies--;
        NotTaken[msg.sender][_id] = true;
        borrowers.push(msg.sender);
        emit bookBorrowed(msg.sender, _id);
    }

    function borrowersView() public view returns (address[] memory) {
        return borrowers;
    }

    function retrun(uint _id) public {
        require(
            NotTaken[msg.sender][_id] == true,
            "The user has nothing to return"
        );
        books[_id].copies++;
        NotTaken[msg.sender][_id] = false;
        emit bookReturned(msg.sender, _id);
    }
}
