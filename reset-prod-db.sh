#Ejecutar esto antes

#cd
#rm -rf ~/SUGU
#tar xvzf SUGU.tgz
#cd SUGU

bundle install

RAILS_ENV="production" rake db:drop 
RAILS_ENV="production" rake db:create

echo "Migrando"
RAILS_ENV="production" rake db:migrate

echo "Seedeando"
RAILS_ENV="production" rake db:seed

echo .
echo "Recompilando assets"
chmod a+rx app/assets -R

echo . 
echo Deteniendo Apache
sudo /etc/init.d/apache2 stop 

echo . 
echo Limpiando assets...
rake tmp:clear
echo . 
RAILS_ENV="production" rake assets:clean

echo . 
echo Recompilando
RAILS_ENV="production" rake assets:precompile
echo . 

sudo /etc/init.d/apache2 start

#Por cierto:
#rails console production
echo Listo - sistema corriendo en http://sugu.supercanal.tv
echo Usuarios de prueba
echo - Admin: salonso / nuwanda
echo - Manager: lbloise / Super2013
echo - Seguridad: jhuenuman / Super2013
echo - RRHH: nstefanoff / Super2013
echo.
echo Revisar base de datos
echo mysql -u sugu -ptangamandApio sugu_production
echo o tambien
echo RAILS_ENV=\"production\" rake db:console


