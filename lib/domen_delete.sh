#!/bin/bash
#для удаления домена его ввв и из днс-панели

echo "!---------------WWW-DOMEN, DOMEN, DNS delete----------------------!" 

echo "1DELETE DOMEN $DOMAIN: " `/usr/local/ispmgr/sbin/mgrctl -m ispmgr domain.delete domain.delete.confirm elid=$DOMAIN  sok=ok`
echo "2DELETE DOMEN $DOMAIN: " `/usr/local/ispmgr/sbin/mgrctl -m ispmgr domain.delete.confirm elid=$DOMAIN  sok=ok`
echo "3DELETE DOMEN $DOMAIN: " `/usr/local/ispmgr/sbin/mgrctl -m ispmgr domain.delete elid=$DOMAIN  sok=ok`
echo "DELETE WWW-DOMEN $DOMAIN: " `/usr/local/ispmgr/sbin/mgrctl -m ispmgr wwwdomain.delete elid=$DOMAIN  sok=ok`

echo "DELETE from DNS-PANEL domen $DOMAIN: " `curl -k -s "https://dns.fastvps.ru//manager/ispmgr?elid=$DOMAIN&extop=on&sok=ok&authinfo=client17554%3Aac59676ed5&func=domain.delete&out=text"`
