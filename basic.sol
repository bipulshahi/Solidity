pragma solidity >0.4.22 <0.6.0;

contract MyFirstContract {
    string private name;
    uint private age;
    
    function setName(string memory newName) public {
        name = newName;
    }
    
    function getName() public returns (string memory) {
        return name;
    }
    
    function setAge(uint newAge) public {
        age = newAge;
    }
    
    function getAge() public returns (uint) {
        return age;
    }
}
