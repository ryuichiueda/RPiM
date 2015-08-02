import Control.Concurrent
import Control.Monad
import System.Posix.Unistd

main = forward

forward = do
  -- 車輪を400Hzで0.1秒回す
  writeFile "/dev/rtmotor0" "400 400 100"
  forward

