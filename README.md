<h1 align="center"> Solución a problemática en un sistema embebido - Raspberry Pi </h1>
<h5 align="center">Aplicación de los temas vistos en clase para la solución de una problemática</h5>

</p>
<p align="center">
<img src ="./media/RPI.gif" alt="Logo" width="1200"/>
</p>

[**Click aquí para acceder al video**](https://youtu.be/VP4K52_BhYk)

La problemática propuesta para el desarrollo del proyecto se fundamenta en el problema con el que cuentan las empresas con robots semi-autónomos, puesto que sus costos incrementan proporcionalmente al aumento de robots. Lo que buscan dichas empresas es que por medio de la implementación de la inteligencia artificial y el procesamiento de imágenes, se logrén encontrar soluciones y con ello disminuyan sus costos operativos. El resultado que se espera es que por medio de la segmentación de imágenes, el robot (sistema embebido) pueda determinar la presencia de obstaculos y reconocer el camino por el que puede realizar su recorrido.

---
<h3 align="left"> Verificar condiciones del sistema embebido </h3>

Las dos condiciones más importantes son la captura de imágenes del entorno del robot y que haya conectividad a internet. Es por ello que para este caso se simuló que las imagenes de entrada estuvieran en una carpeta llamada Proyecto, posterior a su uso se elimina dicha imagen, para que en algún momento no hayan imágenes de entrada, pero que de todas formas el sistema se reestablezca y cumpla sus funciones cuando ingresen nuevas. En cuanto a la conectividad, esta es importante, puesto que en uno de los puntos, las imagenes a las que se les realice la predicción deben ser enviadas a otro lugar, en este caso a otro dispositivo dentro de la red local.

---
<h3 align="left"> Procesamiento de imágenes </h3>

Este es un proceso que se realizará cada minuto, de acuerdo a la configuración del timer en un servicio de systemd, para este caso se tiene comentado en el código la implementación con Python, puesto que las pruebas se realizaron en una raspberry pi 1 y esta no soporta la capacidad de procesamiento necesaria para ejecutar un código que use TensorFlow. Adicionalmente, esta implementación en Python cuenta con soporte a multiproceso.

---
<h3 align="left"> Transmisión de datos </h3>

Mediante la implementación de crontables, cada vez que se reinicie el sistema embebido, se creará una AesKey, la cual se cifrará de manera simétrica y posteriormente, cuando haya conexión a internet se enviara la imagen que se predijo cifrada asimétricamente, en caso de que la conexión se caiga, las imágenes predecidas esperarán en una cola y apenas se conecte de nuevo, se enviará. Es importante tener en cuenta siempre la seguridad. Finalmente, en caso de que no se arregle la conexión de internet y se supere el límite de 1GB en la carpeta, no se vovlerán a hacer predicciones hasta que se desocupe la cola.

---
<h2 align="left"> Desarrollado por: </h2>

✈️ Andrea Juliana Ruiz Gómez, [GitHub](https://github.com/andrearuizg), Email: andrea_ruiz@javeriana.edu.co
