module OptimaForHasql.Param
where

import OptimaForHasql.Prelude
import Optima
import qualified Data.Text.Encoding as Text


{-|
Amount of connections in the pool.
-}
poolSize :: Param Int
poolSize =
  value "Amount of connections in the pool"
    (showable 1) unformatted implicitlyParsed

{-|
Amount of seconds for which the unused connections are kept open.
-}
poolTimeout :: Param NominalDiffTime
poolTimeout =
  value "Amount of seconds for which the unused connections are kept open"
    (showable 10) unformatted implicitlyParsed

{-|
Server host.
-}
host :: Param ByteString
host =
  fmap Text.encodeUtf8 $
  value
    "Server host"
    (explicitlyRepresented id "127.0.0.1")
    unformatted
    implicitlyParsed

{-|
Server port.
-}
port :: Param Word16
port =
  value
    "Server port"
    (showable 5432)
    unformatted
    implicitlyParsed

{-|
Username.
-}
user :: Param ByteString
user =
  fmap Text.encodeUtf8 $
  value
    "Username"
    (explicitlyRepresented id "postgres")
    unformatted
    implicitlyParsed

{-|
Password.
-}
password :: Param ByteString
password =
  fmap Text.encodeUtf8 $
  value
    "Password"
    (explicitlyRepresented id "")
    unformatted
    implicitlyParsed

{-|
Database name.
-}
database :: Param ByteString
database =
  fmap Text.encodeUtf8 $
  value
    "Database name"
    (explicitlyRepresented id "postgres")
    unformatted
    implicitlyParsed
