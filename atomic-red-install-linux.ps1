IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);
Install-AtomicRedTeam -getAtomics;
cd /home/adminuser/AtomicRedTeam/atomics/;
Invoke-AtomicTest
