pragma solidity ^0.4.23;

// Fund where anyone can deposit but only the owner can withdraw (real ether)
contract SimpleFund {
    uint private balance;
    address private owner;
    
    constructor() public {
        balance = 0;
        owner = msg.sender;
    }
    
    function getBalance() public view returns (uint) {
        return balance;
    }
    
    function deposit() public payable {
        require(msg.sender.balance >= msg.value);
        balance += msg.value;
    }

    function withdraw(uint ammount) public {
        require(msg.sender == owner);
        require(balance >= ammount);
        balance -= ammount;
        msg.sender.transfer(ammount);
    }
}
