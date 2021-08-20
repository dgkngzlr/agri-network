#!/bin/bash

docker exec -e "CORE_PEER_LOCALMSPID=SupplierMSP" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp" -e "CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051" -e "CORE_PEER_TLS_ENABLED=true" -it cli bash -c "./scripts/createChannel.sh && peer channel list"

cat ./scripts/log.txt






