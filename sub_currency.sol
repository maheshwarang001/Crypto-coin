pragma solidity >=0.7.0 <0.9.0;

//The contract allows only its creator to create new coins
//Anyone can send coins to each other just through the ethereum address

contract Coin{

    address public minter;
    mapping (address =>uint) public balances;

    event Sent(address from, address to, uint amount);


    constructor(){
        minter = msg.sender;
    }

    //make new coins and send them to an address
    //only owner can create new coins
    function mint(address reciever, uint amount) public{
        require(msg.sender == minter);
        balances[reciever] += amount;
    }

    //send any amount of coins
    //to an existing address

    error insufficientBalance(uint requested , uint available);


    function exchange(address reciever, uint amount) public{
        
        //if transfer amount is greater than wallet .... revert


        if(amount > balances[msg.sender])
        revert insufficientBalance(
            amount,
            balances[msg.sender]
        );

        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender,reciever,amount);

    }

}
