// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract Counter {
    uint count;
    
    constructor() public {
        count = 1;
    }
    
    function getCount() public view returns(uint){
        return count;
    }
    
    function incrementCount() public {
        count = count + 1;
        
    }
}



`````````````````````````````

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract Counter {
    uint public count = 1;
    
   
    
    function incrementCount() public {
       count ++;
        
    }
}


````````````````````````````````````````````same program but less code
