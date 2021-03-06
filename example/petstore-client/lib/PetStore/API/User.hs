{-
   Swagger Petstore

   This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI Version: 3.0.1
   Swagger Petstore API version: 1.0.5
   Contact: apiteam@swagger.io
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : PetStore.API.User
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module PetStore.API.User where

import PetStore.Core
import PetStore.MimeTypes
import PetStore.Model as M

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Set as Set
import qualified Data.String as P
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified Data.Time as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** User

-- *** createUser

-- | @POST \/user@
-- 
-- Create user
-- 
-- This can only be done by the logged in user.
-- 
createUser 
  :: (Consumes CreateUser MimeJSON, MimeRender MimeJSON User)
  => User -- ^ "body" -  Created user object
  -> PetStoreRequest CreateUser MimeJSON NoContent MimeNoContent
createUser body =
  _mkRequest "POST" ["/user"]
    `setBodyParam` body

data CreateUser 

-- | /Body Param/ "body" - Created user object
instance HasBodyParam CreateUser User 

-- | @application/json@
instance Consumes CreateUser MimeJSON

instance Produces CreateUser MimeNoContent


-- *** createUsersWithArrayInput

-- | @POST \/user\/createWithArray@
-- 
-- Creates list of users with given input array
-- 
createUsersWithArrayInput 
  :: (Consumes CreateUsersWithArrayInput MimeJSON, MimeRender MimeJSON Body)
  => Body -- ^ "body" -  List of user object
  -> PetStoreRequest CreateUsersWithArrayInput MimeJSON NoContent MimeNoContent
createUsersWithArrayInput body =
  _mkRequest "POST" ["/user/createWithArray"]
    `setBodyParam` body

data CreateUsersWithArrayInput 

-- | /Body Param/ "body" - List of user object
instance HasBodyParam CreateUsersWithArrayInput Body 

-- | @application/json@
instance Consumes CreateUsersWithArrayInput MimeJSON

instance Produces CreateUsersWithArrayInput MimeNoContent


-- *** createUsersWithListInput

-- | @POST \/user\/createWithList@
-- 
-- Creates list of users with given input array
-- 
createUsersWithListInput 
  :: (Consumes CreateUsersWithListInput MimeJSON, MimeRender MimeJSON Body)
  => Body -- ^ "body" -  List of user object
  -> PetStoreRequest CreateUsersWithListInput MimeJSON NoContent MimeNoContent
createUsersWithListInput body =
  _mkRequest "POST" ["/user/createWithList"]
    `setBodyParam` body

data CreateUsersWithListInput 

-- | /Body Param/ "body" - List of user object
instance HasBodyParam CreateUsersWithListInput Body 

-- | @application/json@
instance Consumes CreateUsersWithListInput MimeJSON

instance Produces CreateUsersWithListInput MimeNoContent


-- *** deleteUser

-- | @DELETE \/user\/{username}@
-- 
-- Delete user
-- 
-- This can only be done by the logged in user.
-- 
deleteUser 
  :: Username -- ^ "username" -  The name that needs to be deleted
  -> PetStoreRequest DeleteUser MimeNoContent NoContent MimeNoContent
deleteUser (Username username) =
  _mkRequest "DELETE" ["/user/",toPath username]

data DeleteUser  
instance Produces DeleteUser MimeNoContent


-- *** getUserByName

-- | @GET \/user\/{username}@
-- 
-- Get user by user name
-- 
getUserByName 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Username -- ^ "username" -  The name that needs to be fetched. Use user1 for testing. 
  -> PetStoreRequest GetUserByName MimeNoContent User accept
getUserByName  _ (Username username) =
  _mkRequest "GET" ["/user/",toPath username]

data GetUserByName  
-- | @application/xml@
instance Produces GetUserByName MimeXML
-- | @application/json@
instance Produces GetUserByName MimeJSON


-- *** loginUser

-- | @GET \/user\/login@
-- 
-- Logs user into the system
-- 
loginUser 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Username -- ^ "username" -  The user name for login
  -> Password -- ^ "password" -  The password for login in clear text
  -> PetStoreRequest LoginUser MimeNoContent Text accept
loginUser  _ (Username username) (Password password) =
  _mkRequest "GET" ["/user/login"]
    `setQuery` toQuery ("username", Just username)
    `setQuery` toQuery ("password", Just password)

data LoginUser  
-- | @application/xml@
instance Produces LoginUser MimeXML
-- | @application/json@
instance Produces LoginUser MimeJSON


-- *** logoutUser

-- | @GET \/user\/logout@
-- 
-- Logs out current logged in user session
-- 
logoutUser 
  :: PetStoreRequest LogoutUser MimeNoContent NoContent MimeNoContent
logoutUser =
  _mkRequest "GET" ["/user/logout"]

data LogoutUser  
instance Produces LogoutUser MimeNoContent


-- *** updateUser

-- | @PUT \/user\/{username}@
-- 
-- Updated user
-- 
-- This can only be done by the logged in user.
-- 
updateUser 
  :: (Consumes UpdateUser MimeJSON, MimeRender MimeJSON User)
  => User -- ^ "body" -  Updated user object
  -> Username -- ^ "username" -  name that need to be updated
  -> PetStoreRequest UpdateUser MimeJSON NoContent MimeNoContent
updateUser body (Username username) =
  _mkRequest "PUT" ["/user/",toPath username]
    `setBodyParam` body

data UpdateUser 

-- | /Body Param/ "body" - Updated user object
instance HasBodyParam UpdateUser User 

-- | @application/json@
instance Consumes UpdateUser MimeJSON

instance Produces UpdateUser MimeNoContent

