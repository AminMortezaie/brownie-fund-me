// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    mapping(address=> uint256) public addressToAmountFunded;
    
    function fund() public payable{
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }


    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return uint256(price);
    }
}