pragma solidity >0.4.22 <0.6.0;

contract itscoin_ico{
    
    
    //Define maximum no. of coins available
    uint public max_itscoin = 100000;
    
    //Define conversion
    uint public usd_to_itscoin = 1000;
    
    //total ITS coin bought by investors
    uint public total_itscoin_bought = 0;
    
    
    //map from investor address to its equity in ITSCoins and usd_to_itscoin
    mapping(address => uint) equity_itscoins;
    mapping(address => uint) equity_usd;
    
    //check if an investor can buy ITSCoins
    modifier can_buy_itscoins(uint usd_invested){
        require (usd_invested * usd_to_itscoin + total_itscoin_bought <= max_itscoin);
        _;
    }
    
    //Getting the equity in its coin of an investor
    function equity_in_itscoin(address investor) public view returns(uint){
        return equity_itscoins[investor];
    }
    
    //Getting the equity in its usd of an investor
    function equity_in_usd(address investor) public view returns(uint){
        return equity_usd[investor];
    }
    
    //Buying coins
    function buy_itscoin(address investor, uint usd_invested) public 
    can_buy_itscoins(usd_invested){
        uint itscoins_bought = usd_invested * usd_to_itscoin;
        equity_itscoins[investor] += itscoins_bought;
        equity_usd[investor] = equity_itscoins[investor]/1000;
        total_itscoin_bought += itscoins_bought;
    }
    
    //selling coins
    function sell_itscoin(address investor, uint itscoins_sold) public{
        equity_itscoins[investor] -= itscoins_sold;
        equity_usd[investor] = equity_itscoins[investor]/1000;
        total_itscoin_bought -= itscoins_sold;
    }
    
    
    
    
    
    
    
}
