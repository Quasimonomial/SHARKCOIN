pragma solidity ^0.4.8;
import "./User.sol";

contract UserFactory {

  // index of created contracts

  mapping (address => User) public users;

  // deploy a new contract

  function newUser(address uid, string name, string surname, string interests, string about)
    public
    returns(address newUser)
  {
    address u = new User(uid, address(this), name, surname, interests, about);
    users[uid] = u;
    return u;
  }

  // TODO: function to ask if a buddy is registered ot the system
  // TODO: add also a mapping
  // TODO: eleiminate the array if we can't ask a mapping for all of it's parts, which we may want to do
  // TODO: Determine how this fits with the ERC223 token
}
