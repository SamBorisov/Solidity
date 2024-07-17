// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Structs {
    struct User {
        address addr;
        uint score;
        string name;
    }

    User[] public users;
    mapping(address => User) public userlist;

    function func(string calldata _name) public {
        User memory user1 = User(msg.sender, 0, _name); //write
        User memory user2 = User(msg.sender, 0, "Mecho"); //write

        User memory user3 = User({name: _name, score: 0, addr: msg.sender}); //write but different
        user3.addr; //read
        user3.score = 80; //change
        delete user1; //delete

        users.push(user2); //push into arrat
        users.push(User(msg.sender, 2, "Pepko")); //push again
        userlist[msg.sender] = user2; //mapping
    }
}

contract MyTodos {
    struct Todo {
        string task;
        bool finished;
    }

    Todo[] public todos;

    function create(string memory _task) public {
        todos.push(Todo(_task, false));
    }

    function get(
        uint _index
    ) public view returns (string memory task, bool finished) {
        Todo storage todo = todos[_index];
        return (todo.task, todo.finished);
    }

    //update task
    function update(uint _index, string memory _task) public {
        Todo storage todo = todos[_index];
        todo.task = _task;
    }

    //update task
    function finish(uint _index) public {
        Todo storage todo = todos[_index];
        todo.finished = !todo.finished;
    }
}

contract Structs2 {
    struct People {
        uint facnum;
        string name;
    }

    mapping(string => uint) public mapp;

    People public person = People({facnum: 20, name: " Sam"});

    People[] public people;

    function addPersion(string memory _name, uint _facnum) public {
        people.push(People({facnum: _facnum, name: _name}));
        mapp[_name] = _facnum;
    }
}
