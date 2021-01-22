
echo "1. ativate/enable a service"
echo "2. deactivate/disable a service"
read -p "Enter choice: " choice

echo "name of service: " name
case $choice in
	1) systemctl enable ${name} ;;
	2) systemctl disable ${name} ;;
	*) echo "wrong choice, exit" ;;

