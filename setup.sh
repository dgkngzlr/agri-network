#!/bin/bash

cryptogen generate --config crypto-config.yaml --output=crypto-config

configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block -channelID channelorderergenesis

configtxgen -profile ChannelDemo -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID channeldemo

configtxgen -profile ChannelDemo -outputAnchorPeersUpdate ./channel-artifacts/SupplierAnchor.tx -channelID channeldemo -asOrg SupplierMSP

configtxgen -profile ChannelDemo -outputAnchorPeersUpdate ./channel-artifacts/ProducerAnchor.tx -channelID channeldemo -asOrg ProducerMSP

configtxgen -profile ChannelDemo -outputAnchorPeersUpdate ./channel-artifacts/DelivererAnchor.tx -channelID channeldemo -asOrg DelivererMSP

configtxgen -profile ChannelDemo -outputAnchorPeersUpdate ./channel-artifacts/RetailerAnchor.tx -channelID channeldemo -asOrg RetailerMSP