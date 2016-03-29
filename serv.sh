echo "Update repository it take few time"
apt-get -y update > /dev/null

#Install 
echo "Install and run nginx and component"
apt-get install -y nginx 
apt-get install -y python-dev python-virtualenv
apt-get install -y uwsgi uwsgi-plugin-python 
apt-get install -y python-pip > /dev/null 

#install Flask
echo "Install Flask"
pip install Flask > /dev/null
pip install uwsgi > /dev/null


#Nginx setup
rm -rf /etc/nginx/sites-available/default
cp /vagrant/app-serv /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/app-serv /etc/nginx/sites-enabled

service nginx restart

mkdir /var/www
mkdir /var/www/hello
cp /vagrant/py_app.py /var/www/hello
cp /vagrant/welcom.jpg /var/www/hello
echo '127.0.0.1  tapp-serv' > /etc/hosts
uwsgi --socket 127.0.0.1:3031 --wsgi-file /var/www/hello/*.py --callable app --processes 4 --threads 2 &


