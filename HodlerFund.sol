pragma solidity ^0.4.23;

// Fund where the owner can deposit but only withdraw after a certain time
contract HodlerFund {
    uint private balance;
    uint private hodlTime;
    uint private releaseTime;
    address private owner;
    
    constructor() public {
        balance = 0;
        hodlTime = 60;
        releaseTime = 0;
        owner = msg.sender;
    }
    
    function getBalance() public view returns (uint) {
        return balance;
    }
    
    function getHodlTime() public view returns (uint) {
        return hodlTime;
    }
    
    function getReleaseTime() public view returns (uint) {
        return releaseTime;
    }
    
    function getRemainingTime() public view returns (uint) {
        if(releaseTime > block.timestamp)
            return releaseTime - block.timestamp;
        else
            return 0;
    }
    
    function deposit() public payable {
        require(msg.sender == owner);
        require(msg.sender.balance >= msg.value);
        balance += msg.value;
        releaseTime = block.timestamp + hodlTime;
    }

    function withdraw(uint ammount) public {
        require(msg.sender == owner);
        require(balance >= ammount);
        require(block.timestamp >= releaseTime);
        balance -= ammount;
        msg.sender.transfer(ammount);
    }
}
