
# Sysprep - Preparando nuestro sistema {#sysprep---preparando-nuestro-sistema}

Durante la instalación de Windows (tanto la versión Server como de escritorio), se genera un identificador de seguridad (**SID**, de *Security IDentifier* ), y otra información específica del PC que debe ser única dentro de nuestra infraestructura.

Como esa información debe ser única por equipo, **afecta a la hora de querer crear una imagen de sistema que nos sirva como base para realizar una instalación masiva en toda nuestra red**.

Por ejemplo, si intentamos meter un equipo clonado a un Active Directory nos dará el siguiente error:

::: center
![](img/temas_comunes/windows_server/sysprep_1.png){width="50%"}
:::

Es por eso que Microsoft incorpora la aplicación **Sysprep**, que **se encarga** de eliminar esa información específica. Se encuentra en la ruta "`%WINDIR%\system32\sysprep\sysprep.exe`" y puede ser ejecutado tanto en consola como en entorno gráfico.


Las funciones principales que nos permite Sysprep son:

- Borra la información específica del PC de la imagen de Windows, incluyendo el SID. Esto permite crear imágenes que pueden ser aplicadas a otros equipos.
- Desinstala (pero sin borrar) drivers específicos del equipo.
- Prepara el PC para ser arrancado en modo **OOBE** (*Out-of-Box Experience*). Este sistema deja el equipo con la instalación preparada como si un usuario arrancase por primera vez.
- Permite configuración "desatendida", añadiendo un fichero con las respuestas de configuración.


La manera más sencilla de ejecutarlo es yendo a la ruta mediante el explorador de Windows y haciendo doble click:


![](img/temas_comunes/windows_server/sysprep_2.png){width="35%"}


Tal como se puede ver, **Sysprep** nos ofrece una serie de opciones que podemos elegir en su ejecución:

- **Acción de limpieza del sistema**:
    - **Iniciar la configuración OOBE**. Comentada previamente.
    - **Iniciar modo auditoria del sistema**. El sistema auditoría permite saltarse el OOBE para entrar con permisos de Administrador para realizar configuraciones e instalaciones en la imagen. [Más información](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/audit-mode-overview?view=windows-10)
    - **Generalizar**: Esta es la opción que elimina la información específica del equipo.

::: infobox
**Si queremos crear una imagen o usar una máquina clonada tenemos que usar la opción generalizar.**
:::

- **Opciones de apagado**: Qué hacer una vez ejecutado Sysprep.

