{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.DisableAvailabilityZonesForLoadBalancer
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes the specified EC2 Availability Zones from the set of configured
-- Availability Zones for the load balancer. There must be at least one
-- Availability Zone registered with a load balancer at all times. Once an
-- Availability Zone is removed, all the instances registered with the load
-- balancer that are in the removed Availability Zone go into the OutOfService
-- state. Upon Availability Zone removal, the load balancer attempts to
-- equally balance the traffic among its remaining usable Availability Zones.
-- Trying to remove an Availability Zone that was not associated with the load
-- balancer does nothing. For more information, see Disable an Availability
-- Zone from a Load-Balanced Application in the Elastic Load Balancing
-- Developer Guide.
-- https://elasticloadbalancing.amazonaws.com/?AvailabilityZones.member.1=us-east-1a
-- &LoadBalancerName=MyHTTPSLoadBalancer &Version=2012-06-01
-- &Action=DisableAvailabilityZonesForLoadBalancer &AUTHPARAMS us-east-1b
-- ba6267d5-2566-11e3-9c6d-eb728EXAMPLE.
module Network.AWS.ELB.V2012_06_01.DisableAvailabilityZonesForLoadBalancer
    (
    -- * Request
      DisableAvailabilityZonesForLoadBalancer
    -- ** Request constructor
    , disableAvailabilityZonesForLoadBalancer
    -- ** Request lenses
    , raziLoadBalancerName
    , raziAvailabilityZones

    -- * Response
    , DisableAvailabilityZonesForLoadBalancerResponse
    -- ** Response lenses
    , razoAvailabilityZones
    ) where

import Network.AWS.Request.Query
import Network.AWS.ELB.V2012_06_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DisableAvailabilityZonesForLoadBalancer' request.
disableAvailabilityZonesForLoadBalancer :: Text -- ^ 'raziLoadBalancerName'
                                        -> [Text] -- ^ 'raziAvailabilityZones'
                                        -> DisableAvailabilityZonesForLoadBalancer
disableAvailabilityZonesForLoadBalancer p1 p2 = DisableAvailabilityZonesForLoadBalancer
    { _raziLoadBalancerName = p1
    , _raziAvailabilityZones = p2
    }
{-# INLINE disableAvailabilityZonesForLoadBalancer #-}

data DisableAvailabilityZonesForLoadBalancer = DisableAvailabilityZonesForLoadBalancer
    { _raziLoadBalancerName :: Text
      -- ^ The name associated with the load balancer.
    , _raziAvailabilityZones :: [Text]
      -- ^ A list of Availability Zones to be removed from the load
      -- balancer. There must be at least one Availability Zone registered
      -- with a load balancer at all times. Specified Availability Zones
      -- must be in the same region.
    } deriving (Show, Generic)

-- | The name associated with the load balancer.
raziLoadBalancerName :: Lens' DisableAvailabilityZonesForLoadBalancer (Text)
raziLoadBalancerName f x =
    f (_raziLoadBalancerName x)
        <&> \y -> x { _raziLoadBalancerName = y }
{-# INLINE raziLoadBalancerName #-}

-- | A list of Availability Zones to be removed from the load balancer. There
-- must be at least one Availability Zone registered with a load balancer at
-- all times. Specified Availability Zones must be in the same region.
raziAvailabilityZones :: Lens' DisableAvailabilityZonesForLoadBalancer ([Text])
raziAvailabilityZones f x =
    f (_raziAvailabilityZones x)
        <&> \y -> x { _raziAvailabilityZones = y }
{-# INLINE raziAvailabilityZones #-}

instance ToQuery DisableAvailabilityZonesForLoadBalancer where
    toQuery = genericQuery def

data DisableAvailabilityZonesForLoadBalancerResponse = DisableAvailabilityZonesForLoadBalancerResponse
    { _razoAvailabilityZones :: [Text]
      -- ^ A list of updated Availability Zones for the load balancer.
    } deriving (Show, Generic)

-- | A list of updated Availability Zones for the load balancer.
razoAvailabilityZones :: Lens' DisableAvailabilityZonesForLoadBalancerResponse ([Text])
razoAvailabilityZones f x =
    f (_razoAvailabilityZones x)
        <&> \y -> x { _razoAvailabilityZones = y }
{-# INLINE razoAvailabilityZones #-}

instance FromXML DisableAvailabilityZonesForLoadBalancerResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DisableAvailabilityZonesForLoadBalancer where
    type Sv DisableAvailabilityZonesForLoadBalancer = ELB
    type Rs DisableAvailabilityZonesForLoadBalancer = DisableAvailabilityZonesForLoadBalancerResponse

    request = post "DisableAvailabilityZonesForLoadBalancer"
    response _ = xmlResponse
