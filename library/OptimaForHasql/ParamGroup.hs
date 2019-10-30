module OptimaForHasql.ParamGroup
where

import OptimaForHasql.Prelude
import Optima
import qualified Hasql.Pool as Pool
import qualified Hasql.Connection as Connection
import qualified Data.Text.Encoding as Text


{-|
Parser of pool settings as a parameter group.
-}
poolSettings :: ParamGroup Pool.Settings
poolSettings =
  (,,) <$> size <*> timeout <*> connectionSettings
  where
    size =
      member "pool-size" $
      value "Amount of connections in the pool"
        (showable 1) unformatted implicitlyParsed
    timeout =
      member "pool-timeout" $
      value "Amount of seconds for which the unused connections are kept open"
        (showable 10) unformatted implicitlyParsed

{-|
Parser of connection settings as a parameter group.
-}
connectionSettings :: ParamGroup Connection.Settings
connectionSettings =
  Connection.settings <$> host <*> port <*> user <*> password <*> database
  where
    host =
      fmap Text.encodeUtf8 $
      member "host" $
      value
        "Server host"
        (explicitlyRepresented id "127.0.0.1")
        unformatted
        implicitlyParsed
    port =
      member "port" $
      value
        "Server port"
        (showable 5432)
        unformatted
        implicitlyParsed
    user =
      fmap Text.encodeUtf8 $
      member "user" $
      value
        "Username"
        (explicitlyRepresented id "postgres")
        unformatted
        implicitlyParsed
    password =
      fmap Text.encodeUtf8 $
      member "password" $
      value
        "Password"
        (explicitlyRepresented id "")
        unformatted
        implicitlyParsed
    database =
      fmap Text.encodeUtf8 $
      member "database" $
      value
        "Database name"
        (explicitlyRepresented id "postgres")
        unformatted
        implicitlyParsed
