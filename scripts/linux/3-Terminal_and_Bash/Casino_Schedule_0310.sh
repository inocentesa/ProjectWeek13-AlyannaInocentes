#!/bin/bash
# 0310 schedule

cat 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep '05:00:00 AM' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep '08:00:00 AM' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep '02:00:00 PM' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep '08:00:00 PM' >> Dealers_working_during_losses
cat 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep '11:00:00 PM' >> Dealers_working_during_losses
