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
