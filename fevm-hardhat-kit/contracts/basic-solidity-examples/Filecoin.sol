// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

contract Filecoin{
     string[] public messages;
     string _newName;
        string tempName;

    function AddName(string memory name) public {
        _newName = name;
    }

    
    function getName() public view returns(string memory){
      return _newName;
    }
   

    function addMessage(string memory _message) public {
        messages.push(_message);
    }

    function getMessages() public view returns (string[] memory) {
        return messages;
    }
}