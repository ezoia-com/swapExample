pragma solidity ^0.8.0;

import "./safeERC20.sol";

interface UniRouter {
  function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
    external
    payable
    returns (uint[] memory amounts);

  function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
    external
    returns (uint[] memory amounts);
} 

contract Swap {
  
  UniRouter uRouter = UniRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
  UniRouter sRouter = UniRouter(0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F);

  using SafeERC20 for IERC20;
  IERC20 weth = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
  IERC20 usdt = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
  
  constructor() public { 
    usdt.safeApprove(address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D), 1e50);
    usdt.safeApprove(address(0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F), 1e50);
  }

  function uSwap() public payable {
    address[] memory path = new address[](2);
    path[0] = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    path[1] = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    uRouter.swapExactETHForTokens{value : msg.value}(1, path, address(this), block.timestamp + 1 hours);
  }    
  
  function sArb() public {
    uint swappedValue = usdt.balanceOf(address(this));
    address[] memory path2 = new address[](2); 
    path2[0] = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    path2[1] = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    sRouter.swapExactTokensForETH(swappedValue, 1, path2, msg.sender, block.timestamp + 1 hours);

  }
  
}
