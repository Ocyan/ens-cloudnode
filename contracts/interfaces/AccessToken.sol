pragma solidity ^0.4.24;

/**
 * The access token is the bridging point between an identity (wallet or Smart Contract) of the network,
 * and a cloud provider. When you implement this interface please make sure you try to integrate it with
 * ENS, as it will makes the result much more robust and dynamic (see Public Keys with ENS).
 *
 * For Public Keys please consult [PublicResolver](https://github.com/ensdomains/ens/blob/master/contracts/PublicResolver.sol)
 *
 * Notes:
 * - The Access token shall be able to selfdestruct by the call of either the cloud provider or the user.
 * - The ID of the AccessToken is the address of the SmartContract itself
 * - The Access Token might be able to change the user that it points to, but should never change the
 *   vendor that is assigned to.
 * - In case of the change of the User-owner, an event shall be emitted UserChanged.
 */
interface AccessToken {
    event UserChanged(address oldUser, address newUser);

    // Only the User Owner of this ID shall be able to change this.
    function changeUser(address newUser, bytes32 x, bytes32 y) public;

    // The user's Pub Key that is tight to this account. The user is expected to sign its
    // transactions to the user, their private key. The Provider shall double check the
    // authenticity of the origin of the non-chain actions, using this public key.
    function userPubKey() external view returns (bytes32 x, bytes32 y);

    // The user's DApp, Shall make sure, that the vendor who replies to the user, is the
    // one tight to this accessKey. With this assumption, the user can be sure that the DApp
    // is making use the desired backend of their choise.
    function vendorPubKey() external view returns (bytes32 x, bytes32 y);
}
