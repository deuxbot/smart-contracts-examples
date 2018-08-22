pragma solidity ^0.4.24;

contract Greeter {
    
    string public name = "Unknown";
    
    function setName(string _name) public {
        name = _name;
    }
    
    function getName() public view returns (string) {
        return name;
    }
}
