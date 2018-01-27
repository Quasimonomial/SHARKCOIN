pragma solidity ^0.4.8;
import "./User.sol";

contract UserFactory {

  struct Data {
    address uid;
    address factory;
  }
  // index of created contracts
  mapping (address => Data) public users;
  address[] public usersList;
  address public governingCoin;

  function UserFactory(_sharkAddress) public returns (bool success) {
    governingCoin = _sharkAddress;
    return true;
  }

  // useful to know the row count in contracts index

  function getUserCount() public constant returns(uint userCount)
  {
   return usersList.length;
  }

  // deploy a new contract

  function newUser(address uid, string name, string surname, string interests, string about)
    public
    returns(address newUserAddress)
  {
    // TODO: throw error and return false if our user already exists
    // this is a security thing as we give new users shark coin, and if they sign up a new user, we give them coins
    address u = new User(uid, address(this), governingCoin, name, surname, interests, about);
    users[uid] = Data({
      uid: uid,
      factory: address(this)
    });
    usersList.push(uid);
    return u;
  }

  // TODO: function to ask if a buddy is registered ot the system
  function buddyRegister(address newBuddy) public
  {
    return false;
  }
  // TODO: eleiminate the array if we can't ask a mapping for all of it's parts, which we may want to do
  function elimArr() public
  {
    return false;
  }
}
