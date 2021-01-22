#!/bin/bash
 
# function menu
show_menus() {
	echo ""
	echo ""
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Install Openstack"
	echo "2. Install Git"
	echo "3. Install Jenkins"
	echo "4. Install another package"
	echo "5. Install Devops (OpenStack + Git + Jenkins)"
	echo "6. System update"
	echo "7. List all packages installed"
	echo "8. Remove a package"
	echo "9. Add a user"
	echo "10. Add a group"
	echo "11. List groups of a user"
	echo "12. Get a service's status"
	echo "13. Restart a service"
	echo "14. Activate / Deactivate a service"
	echo "q. Quit"
	echo ""
}

read_options() {
	local choice
	read -p "Enter choice: " choice
	clear
	case $choice in
		1) 	./script_install_openstack.sh ;;
		2) 	./script_install_git.sh ;;
		3) 	./script_install_jenkins.sh ;;
		4) 	./script_install_pkg.sh ;;

		5) 	./script_install_openstack.sh 
		 	./script_install_git.sh
		   	./script_install_jenkins.sh ;;

		6) 	./script_sysupdate.sh ;;
		7) 	./script_list_pkgs.sh ;;
		8) 	./script_remove_pkg.sh ;;
		9) 	./script_add_user.sh ;;
		10) 	./script_add_group.sh ;;
		11) 	./script_list_groups_user.sh ;;
		12) 	./script_service_status.sh ;;
		13) 	./script_restart_service.sh ;;
		14) 	./script_act-deact_service.sh ;;

		q) 	exit 0 ;;

		*) 	echo "Error please input correctly" ;;
	esac
}


# Main Loop
while true
do
	show_menus
	read_options
done

