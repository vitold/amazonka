{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.APIGateway.UpdateStage
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Changes information about a < Stage> resource.
module Network.AWS.APIGateway.UpdateStage
    (
    -- * Creating a Request
      updateStage
    , UpdateStage
    -- * Request Lenses
    , usPatchOperations
    , usRestAPIId
    , usStageName

    -- * Destructuring the Response
    , stage
    , Stage
    -- * Response Lenses
    , sDeploymentId
    , sVariables
    , sClientCertificateId
    , sCreatedDate
    , sCacheClusterStatus
    , sMethodSettings
    , sLastUpdatedDate
    , sCacheClusterSize
    , sCacheClusterEnabled
    , sStageName
    , sDescription
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Requests Amazon API Gateway to change information about a < Stage>
-- resource.
--
-- /See:/ 'updateStage' smart constructor.
data UpdateStage = UpdateStage'
    { _usPatchOperations :: !(Maybe [PatchOperation])
    , _usRestAPIId       :: !Text
    , _usStageName       :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateStage' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'usPatchOperations'
--
-- * 'usRestAPIId'
--
-- * 'usStageName'
updateStage
    :: Text -- ^ 'usRestAPIId'
    -> Text -- ^ 'usStageName'
    -> UpdateStage
updateStage pRestAPIId_ pStageName_ =
    UpdateStage'
    { _usPatchOperations = Nothing
    , _usRestAPIId = pRestAPIId_
    , _usStageName = pStageName_
    }

-- | A list of operations describing the updates to apply to the specified
-- resource. The patches are applied in the order specified in the list.
usPatchOperations :: Lens' UpdateStage [PatchOperation]
usPatchOperations = lens _usPatchOperations (\ s a -> s{_usPatchOperations = a}) . _Default . _Coerce;

-- | The identifier of the < RestApi> resource for the < Stage> resource to
-- change information about.
usRestAPIId :: Lens' UpdateStage Text
usRestAPIId = lens _usRestAPIId (\ s a -> s{_usRestAPIId = a});

-- | The name of the < Stage> resource to change information about.
usStageName :: Lens' UpdateStage Text
usStageName = lens _usStageName (\ s a -> s{_usStageName = a});

instance AWSRequest UpdateStage where
        type Rs UpdateStage = Stage
        request = patchJSON aPIGateway
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance Hashable UpdateStage

instance ToHeaders UpdateStage where
        toHeaders
          = const
              (mconcat
                 ["Accept" =# ("application/json" :: ByteString)])

instance ToJSON UpdateStage where
        toJSON UpdateStage'{..}
          = object
              (catMaybes
                 [("patchOperations" .=) <$> _usPatchOperations])

instance ToPath UpdateStage where
        toPath UpdateStage'{..}
          = mconcat
              ["/restapis/", toBS _usRestAPIId, "/stages/",
               toBS _usStageName]

instance ToQuery UpdateStage where
        toQuery = const mempty
