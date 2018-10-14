# DesarrolloWebEntornoServidor
Practicas DWES

## Control de cookies
Para esta aplicación, según lo comentado en clase, deberemos crear un formulario o menú donde deberemos introducir el nombre y valor de una cookie y que esta se cree, la podamos visualizar directamente en el formulario del archivo jsp, la podamos modificar y la podamos eliminar. Todas estas opciones deben estar disponibles en botones. También deberá haber un botón para volver al menú inicial (index.html). El nombre de la cookie será obligatorio ponerlo (required). 
Para comprobar que las cookies se crean y se modifican, en Google Chrome, iremos a: Configuración/Configuración avanzada/Configuración del contenido/Cookies/Ver todas las cookies y todos los datos del sitio web. Ahí aparecerá localhost que nada más ejecutar el proyecto crea una cookie por defecto llamada "JSESSIONID" más las cookies que vayamos creando en la aplicación.
La apliación se realiza en dos ficheros jsp separados. El primero contiene el formulario para crear, modificar, visualizar y eliminar las cookies (sólo se pueden moficar, visualizar y eliminar, las cookies que nosotros hemos creado en dicha aplicación). Este archivo llamado "menuCookie.jsp" llamará al segundo fichero jsp "cookies.jsp". En "cookies.jsp" es donde haremos la programación para que los botones funcionen:

   1.- Crear las variables necesarias.
   2.- Comprobar el array de Cookies[] para ver si no está vacio y recorrerlo en caso de que no sea null.
   3.- En la opción de crear, crearemos la cookie, asignadole un nombre, un valor, el tiempo de caducidad y cambiando el           mensaje que se va a mostrar. En caso de que ya esté creada, el mensaje deberá indicarlo.
   4.- En la opción de visualizar, comprobaremos que la cookie no sea null y mostraremos el mensaje deseado (en este caso el nombre y el valor). En caso de que la cookie sea null, el mensaje nos dirá que no existe la cookie.
   5.- En la opción de modificar, comprobaremos que la cookie no sea null, cambiaremos el valor de la cookie y mostraremos el mensaje deseado. En caso de que la cookie sea null, el mensaje nos dirá que no existe la cookie.
   6.- En la opción de eliminar, comprobaremos que la cookie no sea null, cambiaremos el tiempo de caducidad a 0 (así es como se elimina) y mostraremos el mensaje deseado. En caso de que la cookie sea null, el mensaje nos dirá que no existe la cookie.
   7.- Por último con el método sendRedirect, enviaremos el valor que tenga la variable en la que hemos metido el mensaje que queremos mostrar en el formulario.

## Caluladora básica
Lo que se quiere hacer en esta aplicación es introducir dos número en dos inputs diferentes y que con las operaciones básicas de sumar, restar, multiplicar y dividir, se haga la operación. Las operaciones (inputs) deberán ser type = "radio" con una de ellas ya seleccionada (checked). Debe haber dos botones, uno para resetear los inputs y otro para volver al menú. El resultado se debe mostrar en el mismo formulario. Sólo se creará un fichero jsp donde estará todo el código. Lo que he hecho es hacer un if else, preguntado por el nombre de cada input de las operaciones si es igual al que he seleccionado, en caso de que sea igual realizará la operación correspondiente. Como los inputs de entrada de datos los he puesto type = "text" debo de hacer un parseInt en cada uno de ellos para transformar el número con formato texto, a un numero con el que poder operar con valor numérico.

## Contador Visitas con cookies
Simplemente, como se ha explicado en clase, realizaremos esta aplicación en un fichero jsp, donde irá mostrando el número de veces que accedemos o visitamos esa web. Cuando entremos por primera vez (en este caso, la cookie es igual a null), se deberá crear automáticamente la cookie y nos dirá que hemos visitado la web una vez, también se mostrará la versión y el protocolo de seguridad (segura), en las siguientes visitas, la información de la cookie no se mostrará. Hay tres botones, uno para recargar la página, otro para eliminar la cookie y otro para ir al menú. Para recargar la página he usado una función de javaScrip que lo que hace es recargar la página cada vez que pulso en el botón de recargar. También al recargar la página, se deberá incrementar el valor de la cookie en uno, ya que es lo que nos dirá las visitas que llevemos realizadas. Al ser de tipo String el valor de la cookie he convertido ese valor en tipo int (Integer.parseInt) para poder operar y sumar uno cada vez que regarguemos. La opción de eliminar, elimina la cookie, con lo cual hay que asignarle un tiempo de caducidad de 0.

## Control de sesiones
Lo que debe hacer esta apliación es poder crear, visualizar, modificar, o eliminar una sesión de usuario. He realizado un formulario donde he añadido los botones para realizar las acciones antes mencionadas y dos inputs donde se recoge el nombre del atributo de la sesión y el valor del atributo de la sesión. Para realizar la comprobación de qué botón se está pulsando, he realizado un if else que va comprobando qué botón se pulsa. Según el botón pulsado, mostrará un mensaje que nos indicará la acción que hemos realizado. Por último hay un botón para volver al menú.


## Control de sesiones
En esta aplicación se deben crear 4 jsp, uno para introducir los datos del usuario, otro para comprobarlos, otro para ejecutar la acción de cerrar sesión y otro con el menú propio del usuario. El usuario y la contraseña vienen predefinidos en el programa, siendo el usuario: paco; y la contraseña: 1234. Si se introduce un usuario erróneo o contraseña no válida se debe indicar con un mensaje de error. En el menú del usuario debe salir la fecha (miercoles, 10 de octubre de 2018, 16:13:51) de la última vez que se entró. En el login principal debe haber un checkbox que al pulsarlo recuerde al usuario. Tanto la fecha como recordar el nombre del usuario se deben hacer con cookies.
*Commit 14/10/2018 (medio dia)
Se inicia con los parámetros establecidos correctamente pero no sale el mensaje de error si no introducimos los que son. Trabajando sobre la fecha que se muestre la última vez que se entró. Fallo en el checkbox, no consigo recordar al usuario.
*Commit 14/10/2018 a las 23:15
El mensaje de error sale al introducir los valores incorrectos, pero no desparece hasta cerrar la apliación. Siguo sin poder recordar el usuario con checkbox.
*Commit 14/10/2018 a las 23:35
He comentado el codigo de las cookies en el archivo login.jsp porque daba error al ejecutarlo.

