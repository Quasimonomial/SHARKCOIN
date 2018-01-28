pragma solidity ^0.4.8;
import "./User.sol";
import "./SharkCoin.sol";

contract UserFactory {
  SharkCoin public sharkCoin;

  // TODO: add bool function to know who is mutual buddies

  struct Data {
    address uid;
    address factory;
    bool exists;
  }
  // index of created contracts
  mapping (address => Data) public users;
  address[] public usersList;
  address public governingCoin;

  function UserFactory(address _sharkAddress) public {
    sharkCoin = SharkCoin(_sharkAddress);
  }

  // useful to know the row count in contracts index

  function getUserCount() public constant returns(uint userCount)
  {
   return usersList.length;
  }

  // deploy a new contract

  function newUser(address uid, string name, string surname, string interests, string about)
    public
    returns(bool success)
  {
    if (userExistsAt(uid)) {
      return false;
    }
    // this is a security thing as we give new users shark coin, and if they sign up a new user, we give them coins
    address u = new User(uid, address(this), sharkCoin, name, surname, interests, about);
    users[uid] = Data({
      uid: uid,
      factory: address(this),
      exists: true
    });
    usersList.push(uid);
    sharkCoin.giftToNewUser(uid);
    AddUser(uid, u);
    return true;
  }

  function userExistsAt(address newBuddy) public constant returns (bool isBuddy)
  {
    return users[newBuddy].exists;
  }

  event AddUser(address uid, address u);
}
