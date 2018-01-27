pragma solidity 0.4.18;

contract Example {
    address public owner;
    string public firstName;
    string public lastName;
    string public interests;
    string public bio;

    // note that these addresses are not public keys of users but instead
    mapping (address => bool) public buddies;
    // Note that this is reviews of us not not reviews we have written, these addresses represent the writer not the recipient
    mapping (address => string) public reviews;
}
