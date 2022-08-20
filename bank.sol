// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract bank {

    address private owner; 
    mapping(address => uint) balance;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable{
        balance[owner] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient Balance");
        balance[owner] -= _amount;        
    }

    function getTotalBalance()public view returns(uint){
        return(balance[owner]);
    }
}