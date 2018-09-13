{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_lets_lens (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/emilypi/.cabal/bin"
libdir     = "/Users/emilypi/.cabal/lib/x86_64-osx-ghc-8.4.3/lets-lens-0.0.1-inplace"
dynlibdir  = "/Users/emilypi/.cabal/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/emilypi/.cabal/share/x86_64-osx-ghc-8.4.3/lets-lens-0.0.1"
libexecdir = "/Users/emilypi/.cabal/libexec/x86_64-osx-ghc-8.4.3/lets-lens-0.0.1"
sysconfdir = "/Users/emilypi/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lets_lens_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lets_lens_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lets_lens_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lets_lens_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lets_lens_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lets_lens_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
