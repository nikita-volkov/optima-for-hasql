module OptimaForHasql.ParamGroup where

import qualified Hasql.Connection as Connection
import qualified Hasql.Pool as Pool
import Optima
import qualified OptimaForHasql.Param as Param
import OptimaForHasql.Prelude

-- |
-- Parser of pool settings as a parameter group.
--
-- Produces a pool acquisition action.
poolAcquirer :: ParamGroup (IO Pool.Pool)
poolAcquirer =
  Pool.acquire
    <$> member "pool-size" Param.poolSize
    <*> member "pool-acquisition-timeout" Param.poolAcquisitionTimeout
    <*> connectionSettings

-- |
-- Parser of connection settings as a parameter group.
connectionSettings :: ParamGroup Connection.Settings
connectionSettings =
  Connection.settings
    <$> member "host" Param.host
    <*> member "port" Param.port
    <*> member "user" Param.user
    <*> member "password" Param.password
    <*> member "database" Param.database
