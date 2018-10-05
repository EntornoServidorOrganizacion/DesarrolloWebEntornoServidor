# DesarrolloWebEntornoServidor
Practicas DWES


No he he añadido el codigo al fichero web.xml porque me daba el siguiente error al ejecutar:
FALLO - Apliación desplegada en la ruta de contexto [/PracticasAula], pero el contexto no pudo arrancar
Pero se añade de la siguiente manera:
    <error-page>
        <error-code>404</error-code>
        <location>HTML/error404.html</location>
    </error-page>