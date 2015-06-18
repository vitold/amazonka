{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SNS.SetEndpointAttributes
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Sets the attributes for an endpoint for a device on one of the supported
-- push notification services, such as GCM and APNS. For more information,
-- see
-- <http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html Using Amazon SNS Mobile Push Notifications>.
--
-- <http://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html>
module Network.AWS.SNS.SetEndpointAttributes
    (
    -- * Request
      SetEndpointAttributes
    -- ** Request constructor
    , setEndpointAttributes
    -- ** Request lenses
    , seaEndpointARN
    , seaAttributes

    -- * Response
    , SetEndpointAttributesResponse
    -- ** Response constructor
    , setEndpointAttributesResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.SNS.Types

-- | /See:/ 'setEndpointAttributes' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'seaEndpointARN'
--
-- * 'seaAttributes'
data SetEndpointAttributes = SetEndpointAttributes'{_seaEndpointARN :: Text, _seaAttributes :: Map Text Text} deriving (Eq, Read, Show)

-- | 'SetEndpointAttributes' smart constructor.
setEndpointAttributes :: Text -> SetEndpointAttributes
setEndpointAttributes pEndpointARN = SetEndpointAttributes'{_seaEndpointARN = pEndpointARN, _seaAttributes = mempty};

-- | EndpointArn used for SetEndpointAttributes action.
seaEndpointARN :: Lens' SetEndpointAttributes Text
seaEndpointARN = lens _seaEndpointARN (\ s a -> s{_seaEndpointARN = a});

-- | A map of the endpoint attributes. Attributes in this map include the
-- following:
--
-- -   @CustomUserData@ -- arbitrary user data to associate with the
--     endpoint. Amazon SNS does not use this data. The data must be in
--     UTF-8 format and less than 2KB.
-- -   @Enabled@ -- flag that enables\/disables delivery to the endpoint.
--     Amazon SNS will set this to false when a notification service
--     indicates to Amazon SNS that the endpoint is invalid. Users can set
--     it back to true, typically after updating Token.
-- -   @Token@ -- device token, also referred to as a registration id, for
--     an app and mobile device. This is returned from the notification
--     service when an app and mobile device are registered with the
--     notification service.
seaAttributes :: Lens' SetEndpointAttributes (HashMap Text Text)
seaAttributes = lens _seaAttributes (\ s a -> s{_seaAttributes = a}) . _Map;

instance AWSRequest SetEndpointAttributes where
        type Sv SetEndpointAttributes = SNS
        type Rs SetEndpointAttributes =
             SetEndpointAttributesResponse
        request = post
        response = receiveNull SetEndpointAttributesResponse'

instance ToHeaders SetEndpointAttributes where
        toHeaders = const mempty

instance ToPath SetEndpointAttributes where
        toPath = const "/"

instance ToQuery SetEndpointAttributes where
        toQuery SetEndpointAttributes'{..}
          = mconcat
              ["Action" =: ("SetEndpointAttributes" :: ByteString),
               "Version" =: ("2010-03-31" :: ByteString),
               "EndpointArn" =: _seaEndpointARN,
               "Attributes" =:
                 toQueryMap "entry" "key" "value" _seaAttributes]

-- | /See:/ 'setEndpointAttributesResponse' smart constructor.
data SetEndpointAttributesResponse = SetEndpointAttributesResponse' deriving (Eq, Read, Show)

-- | 'SetEndpointAttributesResponse' smart constructor.
setEndpointAttributesResponse :: SetEndpointAttributesResponse
setEndpointAttributesResponse = SetEndpointAttributesResponse';
