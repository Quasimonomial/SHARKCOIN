pragma solidity 0.4.18;

contract User {
  address public owner;
  string public firstName;
  string public lastName;
  string public interests;
  string public bio;

  // note that these addresses are not public keys of users but instead
  mapping (address => bool) public buddies;
  // Note that this is reviews of us not not reviews we have written, these addresses represent the writer not the recipient
  mapping (address => string) public reviews;

  function setFirstName(string _newName) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      firstName = newName;
      FirstNameChanged(string _newName);
      return true;
  }

  function setLastName(string _newName) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      lastName = newName;
      LastNameChanged(string _newName);
      return true;
  }

  function setInterests(string _newInterests) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      interests = newInterests;
      InterestsChanged(string _newInterests);
      return true;
  }

  function setBio(string _newBio) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      bio = newBio;
      BioChanged(string _newBio);
      return true;
  }

  event FirstNameChanged(string changedTo);
  event LastNameChanged(string changedTo);
  event InterestsChanged(string changedTo);
  event BioChanged(string changedTo);
}
