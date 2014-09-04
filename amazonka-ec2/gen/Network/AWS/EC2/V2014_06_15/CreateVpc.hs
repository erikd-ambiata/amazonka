{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.CreateVpc
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a VPC with the specified CIDR block. The smallest VPC you can
-- create uses a /28 netmask (16 IP addresses), and the largest uses a /16
-- netmask (65,536 IP addresses). To help you decide how big to make your VPC,
-- see Your VPC and Subnets in the Amazon Virtual Private Cloud User Guide. By
-- default, each instance you launch in the VPC has the default DHCP options,
-- which includes only a default DNS server that we provide
-- (AmazonProvidedDNS). For more information about DHCP options, see DHCP
-- Options Sets in the Amazon Virtual Private Cloud User Guide. Example 1 This
-- example creates a VPC with the CIDR block 10.0.0.0/16.
-- https://ec2.amazonaws.com/?Action=CreateVpc &amp;CidrBlock=10.0.0.0/16
-- &amp;AUTHPARAMS &lt;CreateVpcResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-06-15/"&gt;
-- &lt;requestId&gt;7a62c49f-347e-4fc4-9331-6e8eEXAMPLE&lt;/requestId&gt;
-- &lt;vpc&gt; &lt;vpcId&gt;vpc-1a2b3c4d&lt;/vpcId&gt;
-- &lt;state&gt;pending&lt;/state&gt;
-- &lt;cidrBlock&gt;10.0.0.0/16&lt;/cidrBlock&gt;
-- &lt;dhcpOptionsId&gt;dopt-1a2b3c4d2&lt;/dhcpOptionsId&gt;
-- &lt;instanceTenancy&gt;default&lt;/instanceTenancy&gt; &lt;tagSet/&gt;
-- &lt;/vpc&gt; &lt;/CreateVpcResponse&gt; Example 2 This example creates a
-- VPC with the dedicated tenancy option.
-- https://ec2.amazonaws.com/?Action=CreateVpc &amp;CidrBlock=10.32.0.0/16
-- &amp;InstanceTenancy=dedicated &amp;AUTHPARAMS &lt;CreateVpcResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-06-15/"&gt;
-- &lt;requestId&gt;a9e49797-a74f-4f68-b302-a134a51fd054&lt;/requestId&gt;
-- &lt;vpc&gt; &lt;vpcId&gt;vpc-11a63c78&lt;/vpcId&gt;
-- &lt;state&gt;pending&lt;/state&gt;
-- &lt;cidrBlock&gt;10.32.0.0/16&lt;/cidrBlock&gt;
-- &lt;dhcpOptionsId&gt;dopt-1a2b3c4d2&lt;/dhcpOptionsId&gt;
-- &lt;instanceTenancy&gt;dedicated&lt;/instanceTenancy&gt; &lt;/vpc&gt;
-- &lt;/CreateVpcResponse&gt;.
module Network.AWS.EC2.V2014_06_15.CreateVpc
    (
    -- * Request
      CreateVpc
    -- ** Request constructor
    , createVpc
    -- ** Request lenses
    , cvsCidrBlock
    , cvsInstanceTenancy

    -- * Response
    , CreateVpcResponse
    -- ** Response lenses
    , cvtVpc
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'CreateVpc' request.
createVpc :: Text -- ^ 'cvsCidrBlock'
          -> CreateVpc
createVpc p1 = CreateVpc
    { _cvsCidrBlock = p1
    , _cvsInstanceTenancy = Nothing
    }
{-# INLINE createVpc #-}

data CreateVpc = CreateVpc
    { _cvsCidrBlock :: Text
      -- ^ The network range for the VPC, in CIDR notation. For example,
      -- 10.0.0.0/16.
    , _cvsInstanceTenancy :: Maybe Tenancy
      -- ^ The supported tenancy options for instances launched into the
      -- VPC. A value of default means that instances can be launched with
      -- any tenancy; a value of dedicated means all instances launched
      -- into the VPC are launched as dedicated tenancy instances
      -- regardless of the tenancy assigned to the instance at launch.
      -- Dedicated tenancy instances runs on single-tenant hardware.
      -- Default: default.
    } deriving (Show, Generic)

-- | The network range for the VPC, in CIDR notation. For example, 10.0.0.0/16.
cvsCidrBlock :: Lens' CreateVpc (Text)
cvsCidrBlock f x =
    f (_cvsCidrBlock x)
        <&> \y -> x { _cvsCidrBlock = y }
{-# INLINE cvsCidrBlock #-}

-- | The supported tenancy options for instances launched into the VPC. A value
-- of default means that instances can be launched with any tenancy; a value
-- of dedicated means all instances launched into the VPC are launched as
-- dedicated tenancy instances regardless of the tenancy assigned to the
-- instance at launch. Dedicated tenancy instances runs on single-tenant
-- hardware. Default: default.
cvsInstanceTenancy :: Lens' CreateVpc (Maybe Tenancy)
cvsInstanceTenancy f x =
    f (_cvsInstanceTenancy x)
        <&> \y -> x { _cvsInstanceTenancy = y }
{-# INLINE cvsInstanceTenancy #-}

instance ToQuery CreateVpc where
    toQuery = genericQuery def

data CreateVpcResponse = CreateVpcResponse
    { _cvtVpc :: Maybe Vpc
      -- ^ Information about the VPC.
    } deriving (Show, Generic)

-- | Information about the VPC.
cvtVpc :: Lens' CreateVpcResponse (Maybe Vpc)
cvtVpc f x =
    f (_cvtVpc x)
        <&> \y -> x { _cvtVpc = y }
{-# INLINE cvtVpc #-}

instance FromXML CreateVpcResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateVpc where
    type Sv CreateVpc = EC2
    type Rs CreateVpc = CreateVpcResponse

    request = post "CreateVpc"
    response _ = xmlResponse
