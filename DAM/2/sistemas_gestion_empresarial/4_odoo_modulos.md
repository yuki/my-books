
# Arquitectura básica de Odoo {#arquitectura-odoo}

Antes de empezar a añadir funcionalidades propias a Odoo hay que entender la arquitectura que utiliza. Como otras aplicaciones web, es una aplicación **cliente-servidor** usando una **[arquitectura multicapa](https://en.wikipedia.org/wiki/Multitier_architecture)**, en la que entran en juego tres capas:

![Fuente: [Wikipedia](https://en.wikipedia.org/wiki/Multitier_architecture)](img/sge/three_tier.png){width=75%}

En Odoo las capas son:

- **Capa de presentación**: Es una combinación de HTML5, JavaScript y CSS. Desde la versión 15 están transicionando a un framework propio llamado [OWL](https://odoo.github.io/owl/) escrito en [TypeScript](https://en.wikipedia.org/wiki/TypeScript).
- **Capa lógica**: Escrita en Python.
- **Capa de datos**: PostgreSQL como sistema gestor de base de datos relacional.

Dependiendo del alcance del módulo que queramos realizar, el desarrollo se deberá realizar en cualquiera de estas capas. Para ello es importante tener la [documentación](https://www.odoo.com/documentation/saas-19.3/developer.html) a mano.

# Módulos de Odoo {#modulos-odoo}

Las extensiones de servidor y de cliente son empaquetadas como módulos, y opcionalmente cargadas en la base de datos. **Un módulo es una colección de funciones y datos con una única finalidad**.

Los módulos de Odoo pueden añadir nueva lógica de negocio o modificar o extender una lógica ya existente. Por ejemplo, un módulo puede crear reglas propias de nuestro país al sistema de facturación, mientras que otro módulo puede añadir soporte en tiempo real de nuestra flota de autobuses.

Los módulos principales orientados al usuario final se marcan y se muestran como **Aplicaciones** (***Apps***), pero la mayoría de los módulos no son aplicaciones. Los módulos también pueden denominarse **complementos** (*addons*) y los directorios donde el servidor de Odoo los localiza constituyen la ruta de complementos (*addons_path*).

En la [documentación](https://www.odoo.com/documentation/16.0/developer/tutorials/getting_started/02_setup.html) existen distintos varios [tutoriales](https://github.com/odoo/tutorials) para crear distintos módulos. En esta documentación se van a crear distintos módulos utilizando estos como base, pero empezando de cero.

## Componentes de un módulo {#componentes-modulo}

Un módulo puede contener los siguientes componentes, no todos los elementos son obligatorios, ya que depende del módulo contendrá unos u otros:

- **Objetos de negocio**: son declarados como una clase Python. Los campos definidos en estas clases son automaticamente mapeados a columnas de la base de datos gracias a la capa ***ORM***.
- **Objetos de vista**: define la visualización de la interfaz de usuario.
- **Ficheros de datos**: Ficheros CSV o XML declarando el modelo de datos:
  - [Vistas](https://www.odoo.com/documentation/saas-19.3/developer/reference/user_interface/view_architectures.html) o [reportes](https://www.odoo.com/documentation/saas-19.3/developer/reference/backend/reports.html#reference-reports)
  - Datos de configuración (parametrización de módulos o reglas de seguridad)
  - Datos de demostración/demo
  - ...
- **Controladores Web**: Gestiona las solicitudes realizadas por el navegador web.
- **Datos Web estáticos**: imágenes, CSS o fichero JavaScript usados por el interfaz web.

## Estructura del módulo {#estructura-modulo}

Cada módulo es un directorio dentro del **directorio de módulos**. Los directorios de módulos se especifican usando el parámetro [\-\-addons-path]{.verbatim}. El módulo se declara con su **[manifiesto](https://www.odoo.com/documentation/16.0/developer/reference/backend/module.html#reference-module-manifest)** (fichero [\_\_manifest\_\_.py]{.verbatim}), y la estructura básica del módulo debe ser la siguiente:

::: mycode
[Jerarquía de ficheros]{.title}
```console
module
├── models
│   ├── *.py
│   └── __init__.py
├── data
│   └── *.xml
├── __init__.py
└── __manifest__.py
```
:::

### Manifiesto del módulo {#manifiesto-modulo}

El fichero [\_\_manifest\_\_.py]{.verbatim} contiene un único diccionario de Python, donde cada clave especifica un metadato del módulo.

::: mycode
[Fichero manifest]{.title}
```python
{
    'name': "A Module",
    'version': '1.0',
    'depends': ['base'],
    'author': "Author Name",
    'category': 'Category',
    'description': """Description text""",
    # data files always loaded at installation
    'data': [
        'views/mymodule_view.xml',
    ],
    # data files containing optionally loaded demonstration data
    'demo': [
        'demo/demo_data.xml',
    ],
}
```
:::

Existen distintos campos aparte de los arriba representados, que se pueden consultar en la [documentación](https://www.odoo.com/documentation/16.0/developer/reference/backend/module.html#reference-module-manifest).

