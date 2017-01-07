pragma solidity ^0.4.0;
contract ID {

    address public owner;
    
    function ID() {

        owner = msg.sender;
    }
    
    struct User {
        
        string name;
        string email;
        string phone;
        string resAddr;
        uint age;
        bool isEditor;  
        bool isValid;
    }
    
    
    mapping(address => User) users;

    function addEditor(address editor)
    {

        if(msg.sender!=owner && !users[msg.sender].isEditor)
        {
            throw;
        }
        
        users[editor].isEditor = true;

    }


    function setUser(string name, string email, string phone, string resAddr, uint age) {
        
            users[msg.sender].name = name;
            users[msg.sender].email = email;
            users[msg.sender].phone = phone;
            users[msg.sender].resAddr = resAddr;
            users[msg.sender].age = age;
            users[msg.sender].isEditor = false;
            users[msg.sender].isValid = false;
            
    }

    function editUser(address toEdit, string name, string email, string phone, string resAddr, uint age){
            
            if(msg.sender!=owner && !users[msg.sender].isEditor)
            {
                throw;
            }
            
            users[toEdit].name = name;
            users[toEdit].email = email;
            users[toEdit].phone = phone;
            users[toEdit].resAddr = resAddr;
            users[toEdit].age = age;
    }

    function getUser(address user) returns (string name, string email, string phone, string resAddr, uint age, bool isEditor, bool isValid) {
        return (users[user].name, users[user].email, users[user].phone, users[user].resAddr, users[user].age, users[user].isEditor, users[user].isValid);
    }
    
    function getOwner() returns (address own){
        return owner;
    }

    function validateUser(address user) {

        if(msg.sender!=owner && !users[msg.sender].isEditor)
        {
                throw;
        }

        users[user].isValid = true;
    
    }
    
}

