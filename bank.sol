pragma solidity >0.4.22 <0.6.0;

//interface Regulator {
//function checkValue(uint amount) external returns (bool);
//function loan() external returns (bool);
//}

contract Bank {
    uint private value;
    address private owner;
    
    modifier ownerFunc{
        require(owner == msg.sender);
        _;
    }
    
    constructor(uint amount) public {      //d
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) public ownerFunc{  //a
        value += amount;
    }
    
    function withdraw(uint amount) public ownerFunc{  //b
        if (checkValue(amount)) {           //b2
            value -= amount;
        }
    }
    
    function balance() public view returns (uint) {  //c
        return value;
    }
    
    function checkValue(uint amount) public returns (bool) {                    //b1
        // Classic mistake in the tutorial value should be above the amount
        return value >= amount;
    }
    
    function loan() public returns (bool) {        //e
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint private age;
    
    function setName(string memory newName) public {
        name = newName;
    }
    
    function getName() public view returns (string memory) {
        return name;
    }
    
    function setAge(uint newAge) public {
        age = newAge;
    }
    
    function getAge() public view returns (uint) {
        return age;
    }
}
