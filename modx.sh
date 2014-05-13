#!/bin/bash
#проверка сайтов по списку

clear # Очистка экрана

PATH="/bin:/usr/bin:/usr/local/bin:/usr/local/ssl/bin:/usr/sfw/bin:/usr/local/sbin:/1install:/1install/lib" ; export PATH
MYPATH="/1install"

if [ "$USER" != "root" -a "$USER" != "rust" -a "$USER" != "albert" ]; then 
echo ">>>>>>>NO root. Exit<<<<<<" $CHEK
exit 1
fi

# Who to page when an expired domain is detected (cmdline: -e)
ADMIN="info@3dstr.ru,seo@3dstr.ru"

#SERVERFILE='/1install/tmp/list/admin.list'

# Don't send emails by default
ALARM="TRUE"


##########################################
# Purpose: Describe how the script works
# Arguments:
#   None
##########################################
usage()
{	
		tput rev
        echo "CMF MODX Evo autoinstall with ISPmanager panel"
		tput sgr0
        echo "-------------------------------------------------------------"

        echo "Usage: $0 {[ -a add ] || [ -u update ] || [ -c create ]}"
        echo "          {[ -d domain_namee ]} || { -f domainfile}"
		echo "          [ -h ] [ -e email ] [ -a ]"

        echo ""
		echo "  -a add           : Add new modx install"
        echo "  -u update        : Update exist modx"
		echo "  -c create        : Create new ISPmanager user, www-domain, and install new modx"
		echo ""
		echo "  -d          :  "
		echo "  -f domain file   : File with a list of domains"
		echo ""
        echo "  -a               : Dont send a final message through email "
        echo "  -e email address : Email address to send expiration notices"
        echo "  -h               : Print this screen"
        echo ""

        echo "Example:   modx -a 3dstr.ru "

        echo ""
}

##########################################
MODX_ADD()
{
    echo Domain: "${DOMAIN}"
     source modx_add_pevm.sh 
}
##########################################
MODX_UPDATE()
{
     echo Domain: "${DOMAIN}"
     source modx_update.sh 
}
##########################################
MODX_CREATE()
{
     source isp_create_user.sh 
}

##########################################
MODX_MASSADD()
{
        while read DOMAIN
        do
               echo Domain: "CREATE FOR - ${DOMAIN} ---------------"
               source modx_add_pevm.sh 

        done < ${SERVERFILE}
}

##############color for status bar############################
STATUS()
{
red=$(tput setf 4)
green=$(tput setf 2)
reset=$(tput sgr0)
toend=$(tput hpa $(tput cols))$(tput cub 6)

if [ $? -eq 0 ]; then
    echo -n "${green}${toend}[OK]"
else
    echo -n "${red}${toend}[fail]"
fi
echo -n "${reset}"
echo
}




### Evaluate the options passed on the command line
while getopts ze:f:d:u:a:c option
do
        case "${option}"
        in
                a) DOMAIN=${OPTARG}; MODX_ADD;;
				u) DOMAIN=${OPTARG}; MODX_UPDATE;;
				c) DOMAIN=${OPTARG}; MODX_CREATE;;
                d) DOMAIN=${OPTARG};;
                f) SERVERFILE=${OPTARG};MODX_MASSADD;;
				e) ADMIN=${OPTARG};;
				z) ALARM="FALSE";;
                \?) usage
                    exit 1;;
        esac
done


if [ "${DOMAIN}" != "" ]
then
        echo "${DOMAIN}"
		echo "$ISP_USER"
		
elif [ -f "${SERVERFILE}" ]
then
        while read DOMAIN
        do
               echo Domain: "${DOMAIN}"

        done < ${SERVERFILE}

### There was an error, so print a detailed usage message and exit
else
     usage
	 exit 1;
fi


#if [ "${ALARM}" = "TRUE" ]
#then
    #echo "The domain ${DOMAIN} has expired!" \  #| mailx -s "Domain ${DOMAIN} has expired!" ${ADMIN}
#fi

 
# Add an extra newline

### Exit with a success indicator
exit 0