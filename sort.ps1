echo **************************************************

echo ---clearing FINALSU file---

Clear-Content C:\DEV\blacklists\PiHoleSuperList\FINALSU.TXT

echo ---sorting list and deleating duplicates transfering to FINALSU----


Get-Content C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT | Foreach {$_ -replace "0\.0\.0\.0", ""}  | Foreach {$_ -replace "\|\|", ""} | Sort-Object | Get-Unique > C:\DEV\blacklists\PiHoleSuperList\FINALSU.TXT

echo ---clearing final file---

Clear-Content C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT

echo ---moving back FINALSU to FINAL---

Get-Content C:\DEV\blacklists\PiHoleSuperList\FINALSU.TXT | Foreach {"0.0.0.0 " + $_}  | Sort-Object | Get-Unique > C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT

echo ---clearing FINALSU file---

Clear-Content C:\DEV\blacklists\PiHoleSuperList\FINALSU.TXT

cd C:\DEV\blacklists\PiHoleSuperList\

.\gitpush.bat

echo ---done--

echo **************************************************

Exit
