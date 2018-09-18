pragma solidity ^0.4.24;

/**
 * Allow the user to set their prefered cloud supplier;
 * The Vendor (or private Node) who shall provide the blockchain
 * cloud services, directly to the end-user.
 */
interface CloudSupplierResolver is ERC165 {
    bytes4 constant INTERFACE_SIGNATURE_CLOUD_SUPPLIER = // 0x7159e755
        bytes4(keccak256("cloudSupplier(bytes32,bytes32)"));

    // The method resolves the cloud supplier that the user wishes to
    // use for the given node (eg a DApp's domain). eg
    //
    // ```
    // bytes32 node = keccak256("ens.domains");
    // bytes32 service = keccak256("ethrpc");
    // CloudVendorResolver resolverAddr = CloudVendorResolver(resolver.cloudSupplier(node, service));
    // ```
    //
    // The returned address is an instance of a Cloud Vendor's Resolver interface
    //
    // Consider using the ENS registry here to return the adderess of an ENS cloud Provider,
    // Instead of statically storring the address of the resolver of your cloud Supplier; eg
    //
    // ```
    // bytes32 node = keccak256("ens.domains");
    // bytes32 cloudNode = suppliers[node];
    // var resolver = ens.resolver(cloudNode)
    // return resolver.addr(cloudNode);
    // ```
    function cloudSupplier(bytes32 node, bytes32 service) external view returns (address);
}

