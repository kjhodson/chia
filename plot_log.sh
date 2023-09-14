tput clear -x
echo "/plots_tmp"
ls -ltrh /plots_tmp/*plot.?.tmp
echo -e "\n/plots_tmp2"
ls -ltrh /plots_tmp2/*plot.?.tmp 
echo -e "\n/plots"
 ls -ltrh /plots/|tail -4
echo -e "\n/plots2"
 ls -ltrh /plots2|tail -4
 echo
echo -e "\n/plots3"
 ls -ltrh /plots3|tail -4
 echo
 echo -e "\n/test_mount"
  ls -ltrh /test_mount|tail -4
  echo
 df -h / /plots_tmp
 df -h /plots /plots2 /plots3 /test_mount|tail -3
 echo
 date
 echo
ps -ef|grep --color=auto '[c]hiapos'
