module OptimaForHasql.Params
where

import OptimaForHasql.Prelude
import Optima
import qualified Hasql.Pool as Pool
import qualified Hasql.Connection as Connection
import qualified OptimaForHasql.Param as Param


{-|
Parser of pool settings as top-level parameters.
-}
poolSettings :: Params Pool.Settings
poolSettings =
  (,,) <$>
    param Nothing "pool-size" Param.poolSize <*>
    param Nothing "pool-timeout" Param.poolTimeout <*>
    connectionSettings

{-|
Parser of connection settings as top-level parameters.
-}
connectionSettings :: Params Connection.Settings
connectionSettings =
  Connection.settings <$> 
    param Nothing "host" Param.host <*>
    param Nothing "port" Param.port <*>
    param Nothing "user" Param.user <*>
    param Nothing "password" Param.password <*>
    param Nothing "database" Param.database
