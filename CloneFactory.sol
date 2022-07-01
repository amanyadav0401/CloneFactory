//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Istaking.sol";

contract ProposalFactory {
    mapping(uint256 => address) public getProposalAddress;

    uint256 public allProposalsLength;

    address public proposalContract;

    address public anything;

    constructor() {}

    function setProposalContract(address proposal) public {
        proposalContract = proposal;
    }

    function createProposal(IERC20 token, address owner) external {
        address proposalClone = Clones.clone(proposalContract);
        IStaking(proposalClone).initialize(token, owner);
        getProposalAddress[allProposalsLength] = proposalClone;
        allProposalsLength++;
    }

    function cloneAnything(address _anything) external {
        address clone = Clones.clone(_anything);
        anything = clone;
    }
}
