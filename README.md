# Agenda simple para mis cursos de Ruby y Rails

Para instalarlo

- Instalen ruby mediante rvm, o controlen que tengan al menos ruby 2.3 instalado, con
```
ruby --version
```

- Fabriquen una carpeta vacía, aparte
```
mkdir Profesor
cd VersionProfesor
```

- Bajen el proyecto con
```
git clone https://github.com/pancutan/agenda
```
- Entren al proyecto
```
cd agenda
```

- Instalen las librerías
```
bundle
```

- Reseteen mi base y pueblenla con el mismo comando
```
rails db:reset
```
(este paso demora un rato)

- Corran el proyecto
```
rescue rails server
```
- Observen cual es el usuario administrador, en el archivo
```db/seeds.rb```

- Si desean comparar vuestro código de este proyecto, de manera fácil, vean de utilizar alguna herramienta de comparación de código como meld
```
sudo apt-get install meld
```
y luego comparen, por ejemplo
```
meld Documentos/agenda Documentos/VersionProfesor/agenda
```


Dudas:
**Sergio A. Alonso**
* sergio@eim.esc.edu.ar
* http://about.me/elbunker
