import Control.Concurrent
import Control.Monad
import System.Posix.Unistd

-- 単純に前進する関数
forward :: IO ()
forward = do
  -- 車輪を400Hzで0.1秒回す
  writeFile "/dev/rtmotor0" "400 400 100"
  -- 無限ループ
  forward

-- 距離センサを読み出す
readSensor :: MVar Bool -> IO ()
readSensor ref = do
  -- センサを休める
  threadDelay 200000
  cs <- readFile "/dev/rtlightsensor0"
  -- 4つのセンサの値を合計
  let v = sum [ read w :: Int | w <- words cs ]
  -- センサが反応していなかったら再度計測
  if v > 1000 then putMVar ref True else readSensor ref

-- センサに何か反応したらモータのスレッドを止める
watchSensor :: MVar Bool -> ThreadId -> IO ()
watchSensor ref w = do
  tf <- takeMVar ref
  if tf then killThread w else watchSensor ref w

main = do
  ref <- newMVar False
  w <- forkIO $ forward
  _ <- forkIO $ readSensor ref

  watchSensor ref w
