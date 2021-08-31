// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract MyCon{
    
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    
   address public owner;
   
   
   constructor() public{
       owner = msg.sender;
   }
   
   function  countevenNum() public view returns (uint){
       uint count = 0;
       
       for(uint i = 0; i < numbers.length; i++){
           if(ifEvenNum(numbers[i])){
               count ++;
           }
           
       }
       return count;
   }
   
   function ifEvenNum(uint _number) public view returns (bool){
    if(_number % 2 == 0){
        return true;
        
    }   
    else {
        return false;
    }
   }
   
   
   function isOwner() public view returns(bool) {
       if(msg.sender == owner){
           return true;
           
       }
       else {
           return false;
       }
   }
   
      //same function with lower code
   function isOwner2() public view returns(bool) {
      return(msg.sender == owner);
   }
   
}
