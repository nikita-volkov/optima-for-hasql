module OptimaForHasql.Params where

import qualified Hasql.Connection as Connection
import qualified Hasql.Pool as Pool
import Optima
import qualified OptimaForHasql.Param as Param
import OptimaForHasql.Prelude

-- |
-- Parser of pool settings as top-level parameters.
--
-- Produces a pool acquisition action.
poolAcquirer :: Params (IO Pool.Pool)
poolAcquirer =
  Pool.acquire
    <$> param Nothing "pool-size" Param.poolSize
    <*> param Nothing "pool-acquisition-timeout" Param.poolAcquisitionTimeout
    <*> connectionSettings

-- |
-- Parser of connection settings as top-level parameters.
connectionSettings :: Params Connection.Settings
connectionSettings =
  Connection.settings
    <$> param Nothing "host" Param.host
    <*> param Nothing "port" Param.port
    <*> param Nothing "user" Param.user
    <*> param Nothing "password" Param.password
    <*> param Nothing "database" Param.database
