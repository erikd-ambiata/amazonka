{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.UpdateAccountPasswordPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Updates the password policy settings for the account. For more information
-- about using a password policy, see Managing an IAM Password Policy in the
-- Using IAM guide. https://iam.amazonaws.com/
-- ?Action=UpdateAccountPasswordPolicy &MinimumPasswordLength=12
-- &RequireSymbols=false &RequireNumbers=true &RequireUppercaseCharacters=true
-- &RequireLowercaseCharacters=true &AllowUsersToChangePassword=true
-- &MaxPasswordAge=90 &PasswordReusePrevention=6 &HardExpiry=false
-- &Version=2010-05-08 &AUTHPARAMS 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.UpdateAccountPasswordPolicy
    (
    -- * Request
      UpdateAccountPasswordPolicy
    -- ** Request constructor
    , updateAccountPasswordPolicy
    -- ** Request lenses
    , uapprHardExpiry
    , uapprRequireSymbols
    , uapprRequireNumbers
    , uapprRequireUppercaseCharacters
    , uapprRequireLowercaseCharacters
    , uapprAllowUsersToChangePassword
    , uapprMaxPasswordAge
    , uapprMinimumPasswordLength
    , uapprPasswordReusePrevention

    -- * Response
    , UpdateAccountPasswordPolicyResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.IAM.V2010_05_08.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'UpdateAccountPasswordPolicy' request.
updateAccountPasswordPolicy :: UpdateAccountPasswordPolicy
updateAccountPasswordPolicy = UpdateAccountPasswordPolicy
    { _uapprHardExpiry = Nothing
    , _uapprRequireSymbols = Nothing
    , _uapprRequireNumbers = Nothing
    , _uapprRequireUppercaseCharacters = Nothing
    , _uapprRequireLowercaseCharacters = Nothing
    , _uapprAllowUsersToChangePassword = Nothing
    , _uapprMaxPasswordAge = Nothing
    , _uapprMinimumPasswordLength = Nothing
    , _uapprPasswordReusePrevention = Nothing
    }
{-# INLINE updateAccountPasswordPolicy #-}

data UpdateAccountPasswordPolicy = UpdateAccountPasswordPolicy
    { _uapprHardExpiry :: Maybe Bool
      -- ^ Prevents IAM users from setting a new password after their
      -- password has expired.
    , _uapprRequireSymbols :: Maybe Bool
      -- ^ Specifies whether IAM user passwords must contain at least one of
      -- the following non-alphanumeric characters: ! @ # $ % ^ &amp; * (
      -- ) _ + - = [ ] { } | '.
    , _uapprRequireNumbers :: Maybe Bool
      -- ^ Specifies whether IAM user passwords must contain at least one
      -- numeric character (0 to 9).
    , _uapprRequireUppercaseCharacters :: Maybe Bool
      -- ^ Specifies whether IAM user passwords must contain at least one
      -- uppercase character from the ISO basic Latin alphabet (A to Z).
    , _uapprRequireLowercaseCharacters :: Maybe Bool
      -- ^ Specifies whether IAM user passwords must contain at least one
      -- lowercase character from the ISO basic Latin alphabet (a to z).
    , _uapprAllowUsersToChangePassword :: Maybe Bool
      -- ^ Allows all IAM users in your account to use the AWS Management
      -- Console to change their own passwords. For more information, see
      -- Letting IAM Users Change Their Own Passwords in the Using IAM
      -- guide.
    , _uapprMaxPasswordAge :: Maybe Integer
      -- ^ The number of days that an IAM user password is valid.
    , _uapprMinimumPasswordLength :: Maybe Integer
      -- ^ The minimum number of characters allowed in an IAM user password.
    , _uapprPasswordReusePrevention :: Maybe Integer
      -- ^ Specifies the number of previous passwords that IAM users are
      -- prevented from reusing.
    } deriving (Show, Generic)

-- | Prevents IAM users from setting a new password after their password has
-- expired.
uapprHardExpiry :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprHardExpiry f x =
    f (_uapprHardExpiry x)
        <&> \y -> x { _uapprHardExpiry = y }
{-# INLINE uapprHardExpiry #-}

-- | Specifies whether IAM user passwords must contain at least one of the
-- following non-alphanumeric characters: ! @ # $ % ^ &amp; * ( ) _ + - = [ ]
-- { } | '.
uapprRequireSymbols :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprRequireSymbols f x =
    f (_uapprRequireSymbols x)
        <&> \y -> x { _uapprRequireSymbols = y }
{-# INLINE uapprRequireSymbols #-}

-- | Specifies whether IAM user passwords must contain at least one numeric
-- character (0 to 9).
uapprRequireNumbers :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprRequireNumbers f x =
    f (_uapprRequireNumbers x)
        <&> \y -> x { _uapprRequireNumbers = y }
{-# INLINE uapprRequireNumbers #-}

-- | Specifies whether IAM user passwords must contain at least one uppercase
-- character from the ISO basic Latin alphabet (A to Z).
uapprRequireUppercaseCharacters :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprRequireUppercaseCharacters f x =
    f (_uapprRequireUppercaseCharacters x)
        <&> \y -> x { _uapprRequireUppercaseCharacters = y }
{-# INLINE uapprRequireUppercaseCharacters #-}

-- | Specifies whether IAM user passwords must contain at least one lowercase
-- character from the ISO basic Latin alphabet (a to z).
uapprRequireLowercaseCharacters :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprRequireLowercaseCharacters f x =
    f (_uapprRequireLowercaseCharacters x)
        <&> \y -> x { _uapprRequireLowercaseCharacters = y }
{-# INLINE uapprRequireLowercaseCharacters #-}

-- | Allows all IAM users in your account to use the AWS Management Console to
-- change their own passwords. For more information, see Letting IAM Users
-- Change Their Own Passwords in the Using IAM guide.
uapprAllowUsersToChangePassword :: Lens' UpdateAccountPasswordPolicy (Maybe Bool)
uapprAllowUsersToChangePassword f x =
    f (_uapprAllowUsersToChangePassword x)
        <&> \y -> x { _uapprAllowUsersToChangePassword = y }
{-# INLINE uapprAllowUsersToChangePassword #-}

-- | The number of days that an IAM user password is valid.
uapprMaxPasswordAge :: Lens' UpdateAccountPasswordPolicy (Maybe Integer)
uapprMaxPasswordAge f x =
    f (_uapprMaxPasswordAge x)
        <&> \y -> x { _uapprMaxPasswordAge = y }
{-# INLINE uapprMaxPasswordAge #-}

-- | The minimum number of characters allowed in an IAM user password.
uapprMinimumPasswordLength :: Lens' UpdateAccountPasswordPolicy (Maybe Integer)
uapprMinimumPasswordLength f x =
    f (_uapprMinimumPasswordLength x)
        <&> \y -> x { _uapprMinimumPasswordLength = y }
{-# INLINE uapprMinimumPasswordLength #-}

-- | Specifies the number of previous passwords that IAM users are prevented
-- from reusing.
uapprPasswordReusePrevention :: Lens' UpdateAccountPasswordPolicy (Maybe Integer)
uapprPasswordReusePrevention f x =
    f (_uapprPasswordReusePrevention x)
        <&> \y -> x { _uapprPasswordReusePrevention = y }
{-# INLINE uapprPasswordReusePrevention #-}

instance ToQuery UpdateAccountPasswordPolicy where
    toQuery = genericQuery def

data UpdateAccountPasswordPolicyResponse = UpdateAccountPasswordPolicyResponse
    deriving (Eq, Show, Generic)

instance AWSRequest UpdateAccountPasswordPolicy where
    type Sv UpdateAccountPasswordPolicy = IAM
    type Rs UpdateAccountPasswordPolicy = UpdateAccountPasswordPolicyResponse

    request = post "UpdateAccountPasswordPolicy"
    response _ = nullaryResponse UpdateAccountPasswordPolicyResponse
