pragma solidity ^0.4.24;

/**
 * Based on Austin Griffith's Counterfactual Sweeper contract
 * https://github.com/austintgriffith/counterfactual-token-repayment/blob/master/contracts/Sweeper/Sweeper.sol
 *
 * Upon creation, this contract will make a repayment on behalf of a debtor
 */
contract DharmaSweeper {

    constructor(
        bytes32 agreementId,
        address repaymentRouter,
        address tokenTransferProxy,
        address tokenAddress,
        uint256 amount
    )
        public
    {
        // approve Dharma's tokenTransferProxy
        IERC20(tokenAddress).approve(tokenTransferProxy, amount);
        // make the repayment
        IRepaymentRouter(repaymentRouter).repay(agreementId, amount, tokenAddress);
        // destroy contract
        selfdestruct(tokenTransferProxy);
    }
}

contract IERC20 {
    function approve(address spender, uint256 value) external {}
}

contract IRepaymentRouter {
    function repay(bytes32 agreementId, uint256 amount, address tokenAddress) external {}
}