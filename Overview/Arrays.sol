// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Array {
    uint[] public uintArrat = [1, 2, 3];
    string[] public stringArray = ["appale", "banana", "carrot"];
    string[] public values; //empty array we add with functions
    uint[][] public arrat2D = [[1, 2, 3], [4, 5, 6]]; //2D array , call with 0,1 = 1 ; 1,3 = 6 ; 0,3 = 3 ; 1,2 = 5...1st numb the string we want to see 2nd the value inside

    function addvalue(string memory _value) public {
        //add string to array  'values'
        values.push(_value);
    }

    function valueCount() public view returns (uint) {
        // see the length of the array 'values'
        return values.length;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

contract test {
    uint[] public a;

    function add() public {
        a.push(4);
        a.push(47);
        a.push(14);
        a.push(7);

        a[1];

        a[0] = 45;

        for (uint i = 0; i < a.length; i++) {
            a[i];
        }
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    uint[10] public FixedArr;

    function push(uint i) public {
        arr.push(i); //push out new elemt in array
    }

    function pop() public {
        arr.pop(); //pop premove the last emelemt of array
    }

    function getLenght() public view returns (uint) {
        return arr.length; //to view the length if array
    }

    function remove(uint index) public {
        delete arr[index]; // did not change the elemet from array
    }
}

contract Arrays {
    //1. storage array - store data in the blockchain , after execute fuctiion it stays in blockchain
    //2. memory array - remeber arrays for use don't store them permenant (temorery only for function) decleare in function
    //3. array arguments and retun arrays from function

    //1.
    uint[] public NameArray; //crud, create , read, update, delete
    bool[] ArrBool;

    function func() external {
        NameArray.push(2); //create
        NameArray.push(7);
        NameArray.push(9);

        NameArray[0]; //read

        NameArray[0] = 20; //update
        NameArray[0];

        delete NameArray[1]; //delete

        for (uint i = 0; i < NameArray.length; i++) {
            NameArray[i]; //for loop
        }
    }

    //2.
    function fan() external {
        uint[] memory MArray = new uint[](10);
        MArray[0] = 10; // cannot push
        MArray[1] = 20; //create

        MArray[0]; //read

        MArray[0] = 15; //update

        delete MArray[4]; //delete
    }

    //3.
    function FunMunc(uint[] calldata myArr) external {
        // if public or iternal use memory not calldata
    }

    function FunChun(uint[] memory myArr) internal {}

    function FunKun(uint[] memory myArr) public {}

    function FunTun(uint[] memory myArr) internal returns (uint[] memory) {}
}

//how to delete and change the length
contract Arr {
    uint[] public arr;

    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        arr.push(4);

        remove(1);

        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);

        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
