#!/bin/bash

CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051
CORE_PEER_TLS_ENABLED=true

export ORDERER_CA=/opt/gopath/fabric-samples/agri-network/crypto-config/ordererOrganizations/agri-network.com/orderers/orderer.agri-network.com/msp/tlscacerts/tlsca.agri-network.com-cert.pem

peer channel create -o orderer.agri-network.com:7050 -c channeldemo -f /opt/gopath/fabric-samples/agri-network/channel-artifacts/channel.tx --tls --cafile $ORDERER_CA

peer channel join -b channeldemo.block --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=ProducerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/users/Admin@producer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.producer.agri-network.com:7051

peer channel join -b channeldemo.block --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=DelivererMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/users/Admin@deliverer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.deliverer.agri-network.com:7051

peer channel join -b channeldemo.block --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/users/Admin@retailer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.retailer.agri-network.com:7051

peer channel join -b channeldemo.block --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051

peer channel update -o orderer.agri-network.com:7050 -c channeldemo -f /opt/gopath/fabric-samples/agri-network/channel-artifacts/SupplierAnchor.tx --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=ProducerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/peers/peer0.producer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/producer.agri-network.com/users/Admin@producer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.producer.agri-network.com:7051

peer channel update -o orderer.agri-network.com:7050 -c channeldemo -f /opt/gopath/fabric-samples/agri-network/channel-artifacts/ProducerAnchor.tx --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=DelivererMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/peers/peer0.deliverer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/deliverer.agri-network.com/users/Admin@deliverer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.deliverer.agri-network.com:7051

peer channel update -o orderer.agri-network.com:7050 -c channeldemo -f /opt/gopath/fabric-samples/agri-network/channel-artifacts/DelivererAnchor.tx --tls --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/peers/peer0.retailer.agri-network.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/retailer.agri-network.com/users/Admin@retailer.agri-network.com/msp
CORE_PEER_ADDRESS=peer0.retailer.agri-network.com:7051

peer channel update -o orderer.agri-network.com:7050 -c channeldemo -f /opt/gopath/fabric-samples/agri-network/channel-artifacts/RetailerAnchor.tx --tls --cafile $ORDERER_CA


export CORE_PEER_LOCALMSPID=SupplierMSP
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/peers/peer0.supplier.agri-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/fabric-samples/agri-network/crypto-config/peerOrganizations/supplier.agri-network.com/users/Admin@supplier.agri-network.com/msp
export CORE_PEER_ADDRESS=peer0.supplier.agri-network.com:7051




