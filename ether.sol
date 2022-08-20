// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract test {
    
    address private owner;
    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) _balances;

    function deposit() public payable {
        _balances[msg.sender] = msg.value;
    }

    function getBalance() public view returns(uint) {
        return _balances[msg.sender];
    }

    function withdraw(address payable _payee) public {
        require(msg.sender == owner, "Not Allowed");
        require(_balances[_payee] > 0, "Zero Balance");
        uint amount = _balances[_payee];
        _payee.transfer(amount);
    }
}
