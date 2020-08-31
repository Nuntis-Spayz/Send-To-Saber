# Send-To-Saber
Command line application to send a file to Open-Core saber


## Lazarus IDE/Free Pascal
  https://www.lazarus-ide.org/index.php?page=downloads
  
  For 64bit Windows
  -- install the 64bit compiler and then 32bit cross compiler -- recommended approach
     Project compile many modes will then build both the 64 and 32 bit executables
  
  For 32bit Windows
  -- install the 32bit compiler
  
     On 32bit Windows, if you also want to build for 64-bit Windows add 
     the 64 bit cross compiler, but you will have to adjust the compile 
     mode options in the project, so don't.

Once up and running, before you open the project you will have to use 
the online pacakage manager, in the Lazarus IDE, to install the following packages

* Requires Package "Synapse 40.1" - for unit Synaser - serial port access
