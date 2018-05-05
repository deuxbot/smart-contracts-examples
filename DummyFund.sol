pragma solidity ^0.4.23;

// Fund where anyone can deposit but only the owner can withdraw (dummy ether)
contract DummyFund {
    uint private balance;
    address private owner;
    
   constructor() public {
        balance = 0;
        owner = msg.sender;
    }
    
    function getBalance() public view returns (uint) {
        return balance;
    }
    
    function deposit(uint ammount) public {
        balance += ammount;
    }

    function withdraw(uint ammount) public {
        require(msg.sender == owner);
        require(balance >= ammount);
        balance -= ammount;
    }
}
