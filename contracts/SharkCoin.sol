pragma solidity ^0.4.8;
import "./UserFactory.sol";

contract SharkCoin {
  address public owner;
  address public factoryAddress;
  uint public constant totalSupply;

  mapping(address => uint256) balances;
  mapping(address => uint256) reputations;
  mapping(address => bool) gifted;

  string public constant name = "Shark Coin";
  string public constant symbol = "SHK";
  uint8 public constant decimals = 0;
  uint8 public constant signUpBonus = 100;

  function SharkCoin(uint balance) public {
    totalSupply = balance;
    owner = msg.sender;
    balances[owner] = balance;
    return true;
  }

  function giftToNewUser(address newContractUser) public returns (bool success) {
    if (msg.sender != factoryAddress) {
      Error("This is defiantely cybercrime");
      return false;
    }
    if (gifted[newContractUser] == true) {
      Error("This user already got intro coins!");
      return false;
    }
    balances[newContractUser].add(signUpBonus);
    gifted[newContractUser] = true;
    totalSupply.add(signUpBonus);

    return true
  }

  function setUserFactory(address _factoryAddress) public returns (bool success) {
    if (msg.sender != owner) {
      Error("You are not the boss of the shark kid");
      return false;
    }
    factoryAddress = _factoryAddress;
    return true;
  }

  function getUserFactory() public constant returns (UserFactory) {
    return UserFactory(factoryAddress);
  }

  function totalSupply() public constant returns (uint) {
    return totalSupply;
  }

  function balanceOf(address sharkUser) public constant returns (uint balance) {
    return balances[sharkUser];
  }

  function transfer(address to, uint tokens) public returns (bool success) {
    if (balances[msg.sender] < tokens) {
      Error("You are too poor");
      return false;
    }

    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    Transfer(msg.sender, to, tokens);

    return true;
  }

  function reputate(address to, uint tokens) public returns (bool success) {
    // TODO: we can only send reputation to addresses that have a registered user with our user factory
    if (balances[msg.sender] < tokens) {
      Error("You are too poor");
      return false;
    }

    balances[msg.sender] = balances[msg.sender].sub(tokens);
    totalSupply.sub(tokens);
    reputations[to] = reputations[to].add(tokens);
    Reputate(msg.sender, to, tokens);

    return true;
  }

  event Error(string msg);
  event Transfer(address indexed from, address indexed to, uint tokens);
  event Reputate(address indexed from, address indexed to, uint tokens);

  // TODO: Add loan functionality
  // TODO: Allow rules to be set for these loans
}
