sudo apt update -y

myname="nutan"
s3_bucket='upgrad-nutan'
timestamp=$(date '+%d%m%Y-%H%M%S')

if [ $( dpkg --list | grep apache2 | cut -d ' ' -f 3 | head -1) == 'apache2' ]
then
        echo "Apache2 is installed.. checking whether it is enabled and active"
        if [ $(systemctl status apache2 | grep disabled | cut -d ';' -f 2) == ' disabled' ]
        then
                systemctl enable apache2
                echo "Enabled now "
                systemctl start apache2
        else
                if [ $(systemctl status apache2 | grep active | cut -d ':' -f 2 | cut -d ' ' -f 2) == 'active' ]
                then
                        echo "Already running"
                else
                        systemctl start apache2
                        echo "apache2 service started"
                fi
        fi
else
        echo "Not installed"
        apt-get install apache2
        echo "apache2 service was installed"
fi

tar -zvcf /tmp/${myname}-httpd-logs-${timestamp}.tar /var/log/apache2/*.log

if [ $(dpkg --list | grep awscli | cut -d ' ' -f 3 | head -1) == 'awscli' ]
then
        aws s3 \
        cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
        s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
else
        echo "awscli not installed"
        apt install awscli
        aws s3 \
fi


