{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.CreateOrUpdateTags
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates new tags or updates existing tags for an Auto Scaling group. A
-- tag's definition is composed of a resource ID, resource type, key and
-- value, and the propagate flag. Value and the propagate flag are optional
-- parameters. See the Request Parameters for more information. For
-- information on creating tags for your Auto Scaling group, see Tag Your Auto
-- Scaling Groups and Amazon EC2 Instances.
-- https://autoscaling.amazonaws.com/?Tags.member.1.ResourceId=my-test-asg
-- &Tags.member.1.ResourceType=auto-scaling-group &Tags.member.1.Key=version
-- &Tags.member.1.Value=1.0 &Tags.member.1.PropagateAtLaunch=true
-- &Version=2011-01-01 &Action=CreateOrUpdateTags &AUTHPARAMS
-- b0203919-bf1b-11e2-8a01-13263EXAMPLE.
module Network.AWS.AutoScaling.V2011_01_01.CreateOrUpdateTags
    (
    -- * Request
      CreateOrUpdateTags
    -- ** Request constructor
    , createOrUpdateTags
    -- ** Request lenses
    , couttTags

    -- * Response
    , CreateOrUpdateTagsResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.AutoScaling.V2011_01_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'CreateOrUpdateTags' request.
createOrUpdateTags :: [Tag] -- ^ 'couttTags'
                   -> CreateOrUpdateTags
createOrUpdateTags p1 = CreateOrUpdateTags
    { _couttTags = p1
    }
{-# INLINE createOrUpdateTags #-}

data CreateOrUpdateTags = CreateOrUpdateTags
    { _couttTags :: [Tag]
      -- ^ The tag to be created or updated. Each tag should be defined by
      -- its resource type, resource ID, key, value, and a propagate flag.
      -- The resource type and resource ID identify the type and name of
      -- resource for which the tag is created. Currently,
      -- auto-scaling-group is the only supported resource type. The valid
      -- value for the resource ID is groupname. The PropagateAtLaunch
      -- flag defines whether the new tag will be applied to instances
      -- launched by the Auto Scaling group. Valid values are true or
      -- false. However, instances that are already running will not get
      -- the new or updated tag. Likewise, when you modify a tag, the
      -- updated version will be applied only to new instances launched by
      -- the Auto Scaling group after the change. Running instances that
      -- had the previous version of the tag will continue to have the
      -- older tag. When you create a tag and a tag of the same name
      -- already exists, the operation overwrites the previous tag
      -- definition, but you will not get an error message.
    } deriving (Show, Generic)

-- | The tag to be created or updated. Each tag should be defined by its
-- resource type, resource ID, key, value, and a propagate flag. The resource
-- type and resource ID identify the type and name of resource for which the
-- tag is created. Currently, auto-scaling-group is the only supported
-- resource type. The valid value for the resource ID is groupname. The
-- PropagateAtLaunch flag defines whether the new tag will be applied to
-- instances launched by the Auto Scaling group. Valid values are true or
-- false. However, instances that are already running will not get the new or
-- updated tag. Likewise, when you modify a tag, the updated version will be
-- applied only to new instances launched by the Auto Scaling group after the
-- change. Running instances that had the previous version of the tag will
-- continue to have the older tag. When you create a tag and a tag of the same
-- name already exists, the operation overwrites the previous tag definition,
-- but you will not get an error message.
couttTags :: Lens' CreateOrUpdateTags ([Tag])
couttTags f x =
    f (_couttTags x)
        <&> \y -> x { _couttTags = y }
{-# INLINE couttTags #-}

instance ToQuery CreateOrUpdateTags where
    toQuery = genericQuery def

data CreateOrUpdateTagsResponse = CreateOrUpdateTagsResponse
    deriving (Eq, Show, Generic)

instance AWSRequest CreateOrUpdateTags where
    type Sv CreateOrUpdateTags = AutoScaling
    type Rs CreateOrUpdateTags = CreateOrUpdateTagsResponse

    request = post "CreateOrUpdateTags"
    response _ = nullaryResponse CreateOrUpdateTagsResponse
