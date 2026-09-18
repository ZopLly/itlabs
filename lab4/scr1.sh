#!/bin/bash 
mkdir ~/test && echo "catalog test was created succesfully" >> ~/report ; touch ~/test/"$(date +%Y%m%d_%H%M%S)" ; 
ping www.net.nikogo.ru || echo "You cannot reach www.net_nikogo.ru, sorry" >> ~/report
