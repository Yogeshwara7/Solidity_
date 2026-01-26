// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for Uniswap V2 Factory
interface Uniswap2Factory {

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    
}
// Interface for Uniswap V2 Pair
interface UniswapV2Pair {

    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    
}
// Main contract to interact with Uniswap pairs
contract Pair{

    address constant FactoryAddress = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    address constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getPairAddress() public view returns(address){
        address pair= Uniswap2Factory(FactoryAddress).getPair(USDC, WETH);

        return pair;
    }

    function getReserves() view public returns(uint112 reserve0, uint112 reserve1){

       address pair=getPairAddress();
       require(pair!=address(0),"Pair does not exist");

       (reserve0, reserve1,)= UniswapV2Pair(pair).getReserves();
    }


    
    
    }