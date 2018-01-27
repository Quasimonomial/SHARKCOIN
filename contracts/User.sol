pragma solidity 0.4.18;
import "./UserFactory.sol";

contract User {
  address public owner;
  UserFactory public factory;
  string public firstName;
  string public lastName;
  string public interests;
  string public bio;


  // note that these addresses are not public keys of users but instead
  mapping (address => bool) public buddies;
  // Note that this is reviews of us not not reviews we have written, these addresses represent the writer not the recipient
  mapping (address => string) public reviews;

  function User(address _owner, address _factoryAddress, string _firstName, string _lastName, string _interests, string _bio) public {
    owner = _owner;
    factory = UserFactory(_factoryAddress);
    firstName = _firstName;
    lastName = _lastName;
    interests = _interests;
    bio = _bio;
  }

  function setFirstName(string _newName) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      firstName = _newName;
      FirstNameChanged(_newName);
      return true;
  }

  function setLastName(string _newName) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      lastName = _newName;
      LastNameChanged(_newName);
      return true;
  }

  function setInterests(string _newInterests) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      interests = _newInterests;
      InterestsChanged(_newInterests);
      return true;
  }

  function setBio(string _newBio) public returns(bool) {
      if (msg.sender != owner) {
          Error("You are not the owner");
          return false;
      }
      bio = _newBio;
      BioChanged(_newBio);
      return true;
  }

  function addBuddy(address newBuddy) public returns(bool) {
    // TODO: Add this function
    // see if this address contains a user contract, if not exit
    /*
      exit out false if you already have a buddy with that
      otherwise update the buddy to true
      if the buddy is updated to true, send an event (person, added person)
    */
    if (msg.sender != owner) {
        Error("You are not the owner");
        return false;
    }
    return false;
  }

  // TODO: remove buddy function
  // TODO: functionality for reviews and how that might work



  event FirstNameChanged(string changedTo);
  event LastNameChanged(string changedTo);
  event InterestsChanged(string changedTo);
  event BioChanged(string changedTo);
  event BuddyAdded(address buddyAdder, address addedBuddy);
  event BuddyRemoved(address buddyRemover, address removedBuddy);
  event Error(string msg);
}
