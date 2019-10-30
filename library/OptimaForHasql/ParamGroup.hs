module OptimaForHasql.ParamGroup
where

import OptimaForHasql.Prelude
import Optima
import qualified Hasql.Pool as Pool
import qualified Hasql.Connection as Connection
import qualified OptimaForHasql.Param as Param


{-|
Parser of pool settings as a parameter group.
-}
poolSettings :: ParamGroup Pool.Settings
poolSettings =
  (,,) <$>
    member "pool-size" Param.poolSize <*>
    member "pool-timeout" Param.poolTimeout <*>
    connectionSettings

{-|
Parser of connection settings as a parameter group.
-}
connectionSettings :: ParamGroup Connection.Settings
connectionSettings =
  Connection.settings <$> 
    member "host" Param.host <*>
    member "port" Param.port <*>
    member "user" Param.user <*>
    member "password" Param.password <*>
    member "database" Param.database
